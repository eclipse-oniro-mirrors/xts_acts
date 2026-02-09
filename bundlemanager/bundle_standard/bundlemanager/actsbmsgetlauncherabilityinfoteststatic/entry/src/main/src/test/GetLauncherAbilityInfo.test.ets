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

let domain: int = 0x0000;
let tag: string = 'testtag';
const BUNDLE_NAME2 = 'ohos.acts.bms.getlauncherabilityinfo.test.static';
const TEST_SUITE_NAME = 'launcherBundleManagerTest'
const PARAM_0: int = 0;
const URI_0100 = "abcde://urigetabilityinfotest";

export default function actsGetLauncherAbilityInfoTest() {

  describe("ActsGetLauncherAbilityInfoTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_0100
     * @tc.number Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_0100
     * @tc.desc   Test getLauncherAbilityInfoSync with valid value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_0100';
      try {
        hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case start');
        let data = launcherBundleManager.getLauncherAbilityInfoSync(BUNDLE_NAME2, 100);
        // hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+' getLauncherAbilityInfoSync success, result is: %{public}s', JSON.stringify(data));
        console.log('getLauncherAbilityInfoSync success');
        expect(data.length>0).assertTrue();
        expect(data[0].labelId).assertLarger(0.0);
        expect(data[0].iconId).assertLarger(0.0);
        expect(data[0].userId).assertEqual(100);
        expect(data[0].installTime).assertLarger(0.0);
        expect(data[0].applicationInfo.cloudStructuredDataSyncEnabled).assertEqual(false);
        expect(data[0].elementName.deviceId).assertEqual("");
        expect(data[0].elementName.bundleName).assertEqual(BUNDLE_NAME2);
        expect(data[0].elementName.moduleName).assertEqual("entry");
        expect(data[0].elementName.abilityName).assertEqual('EntryAbility');
        expect(data[0].elementName.shortName).assertEqual('');
        expect(data[0].elementName.uri).assertEqual('/ohos.acts.bms.getlauncherabilityinfo.test.static/entry/EntryAbility');
        hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
        done();
      } catch (errData) {
        // hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+' getLauncherAbilityInfoSync failed, result is: %{public}s', JSON.stringify(err));
        console.log('getLauncherAbilityInfoSync failed');
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        if (code === 801) {
            expect(code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
      }
    });

    /**
     * @tc.name   Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200
     * @tc.number Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200
     * @tc.desc   Test getLauncherAbilityInfoSync with bundle name is not found return errcode 17700001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200';
        try {
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case start');
          let data = launcherBundleManager.getLauncherAbilityInfoSync('ohos.acts.bms.getlauncherabilityinfo.test.static.test200', 100);
          expect().assertFail();
          done();
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
        } catch (errData) {
          let errMsg = (errData as BusinessError).message;
          let code = (errData as BusinessError).code;
          hilog.info(0x0000, "Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200",
            `errData is errCode:${code} message:${errMsg}`);
          if (code === 801) {
            expect(code).assertEqual(801);
            done();
          } else {
            expect(code).assertEqual(17700001);
            done();
          }
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
        }
      });

    /**
     * @tc.name   Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300
     * @tc.number Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300
     * @tc.desc   Test getLauncherAbilityInfoSync with user ID is not found return errcode 17700004.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300';
        try {
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case start');
          let data = launcherBundleManager.getLauncherAbilityInfoSync(BUNDLE_NAME2, 111);
          expect().assertFail();
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
          done();
        } catch (errData) {
          let errMsg = (errData as BusinessError).message;
          let code = (errData as BusinessError).code;
          hilog.info(0x0000, "Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300",
            `errData is errCode:${code} message:${errMsg}`);
          if (code === 801) {
            expect(code).assertEqual(801);
            done();
          } else {
            expect(code).assertEqual(17700004);
            done();
          }
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
        }
      });

    /**
     * @tc.name   Sub_Bms_Framework_getAbilityInfo_static_00
     * @tc.number Sub_Bms_Framework_getAbilityInfo_static_00
     * @tc.desc   Test getAbilityInfo normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_getAbilityInfo_static_00', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let uri = URI_0100;
      let abilityFlags = bundleManager.AbilityFlag.GET_ABILITY_INFO_WITH_APPLICATION;
      bundleManager.getAbilityInfo(uri, abilityFlags).then((abilityInfos: Array<bundleManager.AbilityInfo>) => {
        expect(abilityInfos.length).assertLarger(PARAM_0);
        for (let index = 0; index < abilityInfos.length; index++) {
          expect(abilityInfos[index].bundleName).assertEqual("ohos.acts.bms.getlauncherabilityinfo.test.static");
          expect(abilityInfos[index].moduleName).assertEqual("entry");
          expect(abilityInfos[index].name).assertEqual("EntryAbility");
          expect(abilityInfos[index].label).assertEqual("label");
          expect(abilityInfos[index].labelId).assertLarger(PARAM_0);
          expect(abilityInfos[index].description).assertEqual("$string:EntryAbility_desc");
          expect(abilityInfos[index].descriptionId).assertLarger(PARAM_0);
          expect(abilityInfos[index].icon).assertEqual("$media:layered_image");
          expect(abilityInfos[index].iconId).assertLarger(PARAM_0);
          expect(abilityInfos[index].process).assertEqual("");
          expect(abilityInfos[index].exported).assertEqual(true);
          expect(abilityInfos[index].orientation).assertEqual(PARAM_0);
          expect(abilityInfos[index].launchType).assertEqual(PARAM_0);
          expect(abilityInfos[index].permissions.length).assertEqual(PARAM_0);
          expect(abilityInfos[index].deviceTypes.length).assertEqual(PARAM_0);
          expect(abilityInfos[index].applicationInfo).not().assertNull();
          expect(abilityInfos[index].metadata.length).assertEqual(PARAM_0);
          expect(abilityInfos[index].enabled).assertEqual(true);
          expect(abilityInfos[index].supportWindowModes.length).assertLarger(PARAM_0);
          expect(abilityInfos[index].windowSize.maxWindowRatio).assertEqual(PARAM_0);
          expect(abilityInfos[index].windowSize.minWindowRatio).assertEqual(PARAM_0);
          expect(abilityInfos[index].windowSize.maxWindowWidth).assertEqual(PARAM_0);
          expect(abilityInfos[index].windowSize.minWindowWidth).assertEqual(PARAM_0);
          expect(abilityInfos[index].windowSize.maxWindowHeight).assertEqual(PARAM_0);
          expect(abilityInfos[index].windowSize.minWindowHeight).assertEqual(PARAM_0);
          expect(abilityInfos[index].excludeFromDock).assertEqual(false);
          expect(abilityInfos[index].skills.length).assertEqual(PARAM_0);
          expect(abilityInfos[index].appIndex).assertEqual(PARAM_0);
          expect(abilityInfos[index].orientationId).assertEqual(PARAM_0);
        }
        done();
      }).catch((err: Error): void => {
        hilog.error(domain, tag, `Sub_Bms_Framework_getAbilityInfo_static_00 catch failed errCode:${err.code} message:${err.message}`);
        if(err.code == 201){
          expect(err.code).assertEqual(201);
          done();
        }else{
          expect().assertFail();
          done();
        }
      });
    })

    /**
     * @tc.name   Sub_Bms_Framework_getAbilityInfo_static_01
     * @tc.number Sub_Bms_Framework_getAbilityInfo_static_01
     * @tc.desc   Test getAbilityInfo with error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_getAbilityInfo_static_01', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let uri = "6666666";
      let abilityFlags = bundleManager.AbilityFlag.GET_ABILITY_INFO_WITH_APPLICATION;
      bundleManager.getAbilityInfo(uri, abilityFlags).then((data: Array<bundleManager.AbilityInfo>) => {
        expect().assertFail();
        done();
      }).catch((err: Error): void => {
        hilog.error(domain, tag, `Sub_Bms_Framework_getAbilityInfo_static_01 catch failed errCode:${err.code} message:${err.message}`);
        if(err.code == 201){
          expect(err.code).assertEqual(201);
          done();
        }else{
          expect(err.code).assertEqual(17700003 );
          done();
        }

      });
    })
  })
  hilog.info(domain, tag, '%{public}s', 'abilityTest end');
}