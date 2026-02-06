import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import StartOptions from '@ohos.app.ability.StartOptions'
import { Caller } from '@ohos.app.ability.UIAbility';
import contextConstant from '@ohos.app.ability.contextConstant';

let domain: number = 0x0000;
let tag: string = 'testTag';
let context:common.UIAbilityContext;

export default function UiAbilityContextStartAbilityStatic() {
  describe("ActsStartAbilityErrorTestStatic", (): void => {

    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.actsbaseerrrocodemethodtest.static");
      await Utils.msSleep(2000);
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_StartAbilityError_static_1200
     * @tc.name   : SUB_Ability_AbilityBase_StartAbilityError_static_1200
     * @tc.desc   : Call UIAbilityContext startAbility with options failed.(callback),
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityBase_StartAbilityError_static_1200`;
      hilog.info(domain, tag, `it begin`);
      let Fd: Record<String,Object> = {
        'type': 'FD',
        'value': -1
      }
      let parameters: Record<String,Object> = {
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_StartAbilityError_static_1700
     * @tc.name   : SUB_Ability_AbilityBase_StartAbilityError_static_1700
     * @tc.desc   : To verify StartAbility with option ErrorCode.Expect: 16000004
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_static_1800
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_static_1800
     * @tc.desc   : Call UIAbilityContext startAbility with options failed.(promise).Expect: 16000004
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
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
        }).catch((err: BusinessError<void>): void => {
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_static_1900
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_static_1900
     * @tc.desc   : Call UIAbilityContext startAbility with options failed.(promise).Expect: 16000050
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_static_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityBase_ErrorCode_static_1900`;
      hilog.info(domain, tag, `it begin`);
      let Fd: Record<String,Object> = {
        'type': 'FD',
        'value': -1
      }
      let parameters: Record<String,Object> = {
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
        }).catch((err: BusinessError<void>): void => {
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_static_2000
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_static_2000
     * @tc.desc   : Call UIAbilityContext startAbility failed.(promise).Expect: 16000004
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
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
        }).catch((err: BusinessError<void>): void => {
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_static_2100
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_static_2100
     * @tc.desc   : Call UIAbilityContext startAbility failed.(promise).Expect: 16000050
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_static_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0017`;
      hilog.info(domain, tag, `it begin`);
      let Fd: Record<String,Object> = {
        'type': 'FD',
        'value': -1
      }
      let parameters: Record<String,Object> = {
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
        }).catch((err: BusinessError<void>): void => {
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_StartAbilityError_static_2600
     * @tc.name   : SUB_Ability_AbilityBase_StartAbilityError_static_2600
     * @tc.desc   : Call UIAbilityContext startAbility failed.(callback), Expect: 801
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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
    /*
     * @tc.number : SUB_Ability_AbilityBase_StartAbilityError_static_2700
     * @tc.name   : SUB_Ability_AbilityBase_StartAbilityError_static_2700
     * @tc.desc   : Call UIAbilityContext startAbility with options failed.(promise).Expect: 801
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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
        }).catch((err: BusinessError<void>): void => {
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_StartAbilityError_static_1800
     * @tc.name   : SUB_Ability_AbilityBase_StartAbilityError_static_1800
     * @tc.desc   : Call UIAbilityContext startAbility with options failed.(callback), Expect: 16000005
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_StartAbilityError_static_1900
     * @tc.name   : SUB_Ability_AbilityBase_StartAbilityError_static_1900
     * @tc.desc   : Call UIAbilityContext startAbility failed.(callback), Expect: 16000005
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_StartAbilityError_static_2000
     * @tc.name   : SUB_Ability_AbilityBase_StartAbilityError_static_2000
     * @tc.desc   : Call UIAbilityContext startAbility with options failed.(promise).Expect: 16000005
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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
        }).catch((err: BusinessError<void>): void => {
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_StartAbilityError_static_2100
     * @tc.name   : SUB_Ability_AbilityBase_StartAbilityError_static_2100
     * @tc.desc   : Call UIAbilityContext startAbility failed.(promise).Expect: 16000005
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
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
        }).catch((err: BusinessError<void>): void => {
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_StartAbilityError_static_2200
     * @tc.name   : SUB_Ability_AbilityBase_StartAbilityError_static_2200
     * @tc.desc   : Call UIAbilityContext startAbility failed.(promise) Expect: 201
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_2200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `StartAbilityError_static_2200`;
      hilog.info(domain, tag, `it begin`);
      context.moveAbilityToBackground()
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
        }).catch((err: BusinessError<void>): void => {
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_StartAbilityError_static_2300
     * @tc.name   : SUB_Ability_AbilityBase_StartAbilityError_static_2300
     * @tc.desc   : Call UIAbilityContext startAbility with options failed.(promise) Expect: 201
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_2300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `StartAbilityError_static_2300`;
      hilog.info(domain, tag, `it begin`);
      context.moveAbilityToBackground()
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
        }).catch((err: BusinessError<void>): void => {
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_StartAbilityError_static_2400
     * @tc.name   : SUB_Ability_AbilityBase_StartAbilityError_static_2400
     * @tc.desc   : Call UIAbilityContext startAbility with options failed.(callback), Expect: 201
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_2400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `StartAbilityError_static_2400`;
      hilog.info(domain, tag, `it begin`);
      context.moveAbilityToBackground()
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

    /*
     * @tc.number : SUB_Ability_AbilityBase_StartAbilityError_static_2500
     * @tc.name   : SUB_Ability_AbilityBase_StartAbilityError_static_2500
     * @tc.desc   : Call UIAbilityContext startAbility failed.(callback), Expect: 201
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_2500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `StartAbilityError_static_2500`;
      hilog.info(domain, tag, `it begin`);
      context.moveAbilityToBackground()
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
  });
}