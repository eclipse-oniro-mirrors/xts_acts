import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import StartOptions from '@ohos.app.ability.StartOptions';
import Want from '@ohos.app.ability.Want';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

let domain: int = 0x0000;
let tag: string = 'SupportWindowModeStaticTest';

export default function SupportWindowModeStaticTest() {
  let context: common.UIAbilityContext;

  describe("SupportWindowModeStaticTest", (): void => {
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.actsabilitybmsenumtest.static"
      }).then(async (): Promise<void> =>{
        hilog.info(domain, tag, 'startAbility success');
        await Utils.msSleep(2000);
        context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'beforeAll end');
      }).catch(()=>{
        hilog.info(domain, tag, 'startAbility fail');
      })
    });

    /**
     * @tc.name   SUB_BMS_SupportWindowMode_Static_0100
     * @tc.number SUB_BMS_SupportWindowMode_Static_0100
     * @tc.desc   Test supportWindowModes as a parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_BMS_SupportWindowMode_Static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const subTag: string = 'SUB_BMS_SupportWindowMode_Static_0100';
        let want: Want = {
          deviceId: '',
          bundleName: 'com.example.actsabilitybmsenumtest.static',
          abilityName: 'EntryAbility'
        };
        let options: StartOptions = {
          supportWindowModes: [
            bundleManager.SupportWindowMode.SPLIT,
            bundleManager.SupportWindowMode.FLOATING
          ]
        };
        try {
          context.startAbility(want, options, (err: BusinessError<void> | null) => {
            hilog.info(domain, tag, `${subTag} error code: ${err?.code}.`);
            expect(`${err?.code}`).assertEqual('0');
            done();
          });
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${subTag} fail.`)
          expect().assertFail();
          done();
        }
      })
  })
}