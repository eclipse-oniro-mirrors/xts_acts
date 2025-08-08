import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

let disable = false;

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(async (done: Function) => {
      let context: common.UIAbilityContext = getContext() as common.UIAbilityContext;
      await context.revokeDelegator().then(() => {
        console.info('revokeDelegator success');
      }).catch((err: BusinessError) => {
        if (err.code == 801) {
          disable = true;
        }
        console.error(`beforeAll revokeDelegator failed, code is ${err.code}, message is ${err.message}`);
      });
      done();
    })
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_HookAbility_0700
     * @tc.name    Only allow DelegatorAbility to call the method once
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_Ability_AbilityRuntime_HookAbility_0700', Level.LEVEL3, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_HookAbility_0700';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      if (disable) {
        done();
        return;
      }
      let context: common.UIAbilityContext = getContext() as common.UIAbilityContext;
      context.revokeDelegator().then(() => {
        hilog.info(0x0000, TAG, '%{public}s', 'revokeDelegator success');
      }).catch((err: BusinessError) => {
        expect(err.code).assertEqual(16000084);
        hilog.info(0x0000, TAG, '%{public}s revokeDelegator failed', JSON.stringify(err));
        done();
      });
      hilog.info(0x0000, TAG, '%{public}s', '--end');
    })

    /*
     * @tc.number  SUB_Ability_AbilityRuntime_HookAbility_0800
     * @tc.name    The API can be called only when the ability is running in the foreground
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_Ability_AbilityRuntime_HookAbility_0800', Level.LEVEL3, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_HookAbility_0800';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      let mpEnable: string =
        systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable', 'false');
      console.log(TAG + `get system parameter mpEnable is ${mpEnable}`);
      if (disable || mpEnable === 'false') {
        done();
        return;
      }
      let want: Want = {
        bundleName: 'com.example.hookabilityhap',
        moduleName: 'entry',
        abilityName: 'EntryAbility',
        parameters:{
          ['startHookAbility'] : 1001
        }
      }
      let context: common.UIAbilityContext = getContext() as common.UIAbilityContext;
      hilog.info(0x0000, TAG, '%{public}s', '--to start');
      context.startAbilityForResult(want).then((result: common.AbilityResult) => {
        hilog.info(0x0000, TAG, '%{public}s', '--startAbilityForResult succeed');
        expect(result.resultCode).assertEqual(16000065);
        done();
      })
      hilog.info(0x0000, TAG, '%{public}s', '--end');
    })
  })
}