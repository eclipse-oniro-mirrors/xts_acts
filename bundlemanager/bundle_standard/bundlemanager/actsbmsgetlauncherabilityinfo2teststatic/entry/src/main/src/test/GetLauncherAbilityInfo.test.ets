import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";

import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base'
import { ShortcutInfo } from 'bundleManager.ShortcutInfo';
import i18n from '@ohos.i18n';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import launcherBundleManager from '@ohos.bundle.launcherBundleManager';
import { LauncherAbilityInfo } from 'bundleManager.LauncherAbilityInfo';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testtag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const TEST_SUITE_NAME = 'launcherBundleManagerTest'

export default function actsGetLauncherAbilityInfo2Test() {

  describe("actsGetLauncherAbilityInfo2Test", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_1200
     * @tc.number Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_1200
     * @tc.desc   Test getLauncherAbilityInfoSync with permission denied return errcode 201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_1200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_1200';
        try {
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case start');
          let data = launcherBundleManager.getLauncherAbilityInfoSync("ohos.acts.bms.getlauncherabilityinfo2.test.static", 100);
          expect().assertFail();
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
          done();
        } catch (errData) {
          let errMsg = (errData as BusinessError).message;
          let code = (errData as BusinessError).code;
          hilog.info(0x0000, "Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_1200",
            `errData is errCode:${code} message:${errMsg}`);
          if (code === 801) {
            expect(code).assertEqual(801);
            done();
          } else {
            expect(code).assertEqual(201);
            hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
            done();
          }
        }
      });
  })
  hilog.info(domain, tag, '%{public}s', 'abilityTest end');
}