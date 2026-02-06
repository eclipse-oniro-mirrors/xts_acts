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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../../hypium/index";
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'
import Utils from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'

let domain: number = 0x0000;
let tag: string = 'testTag';
let context: common.UIAbilityContext

export default function UIAbilityContextStatic() {
  describe("UIAbilityContextStatic", () => {

    beforeAll(() => {
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.uiabilitycontexttest.static")
      await Utils.msSleep(2000);
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.number    : ABILITY_TEST_ABILITYINFO_0100
     * @tc.name      : testAbilityInfoStatic001
     * @tc.desc      : test AbilityInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testAbilityInfoStatic001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testAbilityInfoStatic001 start');
      try {
        hilog.info(domain, tag, 'testAbilityInfoStatic001 info '+ JSON.stringify(context));
        if (context){
          expect(context != null).assertTrue();
          let abilityInfo = context.abilityInfo;
          hilog.info(domain, tag, 'testAbilityInfoStatic001 info '+ JSON.stringify(abilityInfo));
          expect(abilityInfo != null).assertTrue();
          hilog.info(domain, tag, `testAbilityInfoStatic001 abilityInfo.bundleName: ` + abilityInfo.bundleName);
          expect(abilityInfo.bundleName == "com.example.uiabilitycontexttest.static").assertTrue();
          hilog.info(domain, tag, `testAbilityInfoStatic001 abilityInfo.moduleName: ` + abilityInfo.moduleName);
          expect(abilityInfo.moduleName == "entry").assertTrue();
          hilog.info(domain, tag, `testAbilityInfoStatic001 abilityInfo.name: ` + abilityInfo.name);
          expect(abilityInfo.name == "EntryAbility").assertTrue();
          hilog.info(domain, tag, `testAbilityInfoStatic001 abilityInfo.label: ` + abilityInfo.label);
          expect(abilityInfo.label == "$string:EntryAbility_label").assertTrue();
          hilog.info(domain, tag, `testAbilityInfoStatic001 abilityInfo.labelId: ` + abilityInfo.labelId);
          expect(typeof (abilityInfo.labelId) == 'number').assertTrue();
          hilog.info(domain, tag, `testAbilityInfoStatic001 abilityInfo.description: ` + abilityInfo.description);
          expect(abilityInfo.description == "$string:EntryAbility_desc").assertTrue();
          hilog.info(domain, tag, `testAbilityInfoStatic001 abilityInfo.descriptionId: ` + abilityInfo.descriptionId);
          expect(typeof (abilityInfo.descriptionId) == 'number').assertTrue();
          hilog.info(domain, tag, `testAbilityInfoStatic001 abilityInfo.icon: ` + abilityInfo.icon);
          expect(abilityInfo.icon == "$media:layered_image").assertTrue();
          hilog.info(domain, tag, `testAbilityInfoStatic001 abilityInfo.iconId: ` + abilityInfo.iconId);
          expect(typeof (abilityInfo.iconId) == 'number').assertTrue();
          hilog.info(domain, tag, `testAbilityInfoStatic001 abilityInfo.applicationInfo: ` + abilityInfo.applicationInfo.name);
          expect(abilityInfo.applicationInfo.name == "com.example.uiabilitycontexttest.static").assertTrue();
          hilog.info(domain, tag, `testAbilityInfoStatic001 abilityInfo.metadata: ` + abilityInfo.metadata.length);
          expect(abilityInfo.metadata.length >= 0).assertTrue();
          hilog.info(domain, tag, `testAbilityInfoStatic001 success`);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, 'testAbilityInfoStatic001 fail: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_UIABILITYCONTEXT_CURRENTHAPMODULEINFO_0100
     * @tc.name      : testUIAbilityContextCurrentHapModuleInfoStatic001
     * @tc.desc      : test filed of currentHapModuleInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testUIAbilityContextCurrentHapModuleInfoStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "testUIAbilityContextCurrentHapModuleInfoStatic001 begin");
      try {
        if (context) {
          let hapModuleInfo = context.currentHapModuleInfo;
          expect(hapModuleInfo != null).assertTrue();
          hilog.info(domain, tag, 'testUIAbilityContextCurrentHapModuleInfoStatic001 hapModuleInfo.name: ' + hapModuleInfo.name);
          expect(hapModuleInfo.name == "entry").assertTrue();
          hilog.info(domain, tag, 'testUIAbilityContextCurrentHapModuleInfoStatic001 hapModuleInfo.icon: ' + hapModuleInfo.icon);
          expect(hapModuleInfo.icon == "$media:layered_image").assertTrue();
          hilog.info(domain, tag, 'testUIAbilityContextCurrentHapModuleInfoStatic001 hapModuleInfo.iconId: ' + hapModuleInfo.iconId);
          expect(typeof (hapModuleInfo.iconId) == 'number').assertTrue();
          hilog.info(domain, tag, 'testUIAbilityContextCurrentHapModuleInfoStatic001 hapModuleInfo.label: ' + hapModuleInfo.label);
          expect(hapModuleInfo.label == "$string:EntryAbility_label").assertTrue();
          hilog.info(domain, tag, 'testUIAbilityContextCurrentHapModuleInfoStatic001 hapModuleInfo.labelId: ' + hapModuleInfo.labelId);
          expect(typeof (hapModuleInfo.labelId) == 'number').assertTrue();
          hilog.info(domain, tag, 'testUIAbilityContextCurrentHapModuleInfoStatic001 hapModuleInfo.description: ' + hapModuleInfo.description);
          expect(hapModuleInfo.description == "$string:module_desc").assertTrue();
          hilog.info(domain, tag, 'testUIAbilityContextCurrentHapModuleInfoStatic001 hapModuleInfo.descriptionId: ' + hapModuleInfo.descriptionId);
          expect(typeof (hapModuleInfo.descriptionId) == 'number').assertTrue();
          hilog.info(domain, tag, 'testUIAbilityContextCurrentHapModuleInfoStatic001 hapModuleInfo.mainElementName: ' + hapModuleInfo.mainElementName);
          expect(hapModuleInfo.mainElementName == "EntryAbility").assertTrue();
          hilog.info(domain, tag, 'testUIAbilityContextCurrentHapModuleInfoStatic001 hapModuleInfo.metadata: ' + hapModuleInfo.metadata.length);
          expect(hapModuleInfo.metadata.length >= 0).assertTrue();
          hilog.info(domain, tag, 'testUIAbilityContextCurrentHapModuleInfoStatic001 success');
          done();
        } else {
          hilog.info(domain, tag, 'testUIAbilityContextCurrentHapModuleInfoStatic001 testAbilityContext is null');
          expect().assertFail();
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, 'testUIAbilityContextCurrentHapModuleInfoStatic001 fail: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_RESOURCEMANAGER_0100
     * @tc.name      : testResourceManagerStatic001
     * @tc.desc      : test filed of resourceManager
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testResourceManagerStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        if (context) {
          let result = context.resourceManager
          hilog.info(domain, tag, "testResourceManagerStatic001 resourceManager:" + JSON.stringify(result));
          expect(result != null).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, "testResourceManagerStatic001 abilityContext err");
          expect().assertFail();
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `testResourceManagerStatic001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })


  })
}
