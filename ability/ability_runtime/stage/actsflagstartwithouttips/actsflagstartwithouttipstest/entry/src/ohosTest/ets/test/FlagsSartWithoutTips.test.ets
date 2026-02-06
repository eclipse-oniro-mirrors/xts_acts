/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, it, expect, beforeAll, afterEach, Level } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import wantConstant from '@ohos.app.ability.wantConstant';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import { BusinessError } from "@ohos.base";

let selectorBundleName: string = '';
let deviceSupport = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
let context: common.UIAbilityContext;
const driver: Driver = Driver.create();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let isAppSelectorExist = true;
let selectorName = "wei.hmsapp.appgallery";

async function checkAppSelectorExist() {
  try {
    let cmd = 'bm dump -n com.hua' + selectorName;
    await abilityDelegator.executeShellCommand(cmd)
      .then((data) => {
        console.info('executeShellCommand success ' + JSON.stringify(data));
        if (!data.stdResult.includes(selectorName)) {
          console.info('app selector name do not exist');
          return;
        }
        if (data.stdResult.includes("AppSelectorExtensionAbility")) {
          console.info("AppSelectorExtensionAbility exists");
        } else {
          console.info("AppSelectorExtensionAbility do not exists");
          isAppSelectorExist = false;
        }
      })
  } catch (error) {
    console.info("executeShellCommand failed ");
  }
}

const judgeDialog = async (done: Function) => {
  await abilityDelegator.executeShellCommand('aa dump -a').then((data) => {
    console.info('====>aa dump : data : ' + JSON.stringify(data.stdResult));
    if (data.stdResult.includes("/uiextension/AppSelectorExtensionAbility")) {
      let firstString = data.stdResult.split("/uiextension/AppSelectorExtensionAbility");
      let result = firstString[1].split("uri");
      selectorBundleName = 'com.hua' + 'wei.hmsapp.appgallery';
      console.info('====>aa dump result aa string: ' + JSON.stringify(result[0]));
      try {
        expect(result[0]).assertContain("hmsapp.appgallery");
        expect(result[0]).assertContain("main name [AppSelectorExtensionAbility]");
        expect(result[0]).assertContain("ability type [UIEXTENSION]");
        expect(result[0]).assertContain("app state #FOREGROUND");
        done();
      } catch {
        expect().assertFail();
        done();
      }
    } else if (data.stdResult.includes("com.ohos.amsdialog/entry/")) {
      let firstString = data.stdResult.split("com.ohos.amsdialog/entry/");
      let result = firstString[1].split("uri");
      selectorBundleName = 'com.ohos.amsdialog';
      console.info('====>aa dump result aa string: ' + JSON.stringify(result[0]));
      try {
        expect(result[0]).assertContain("bundle name [com.ohos.amsdialog]");
        expect(result[0]).assertContain("ability type [SERVICE]");
        expect(result[0]).assertContain("app state #FOREGROUND");
        done();
      } catch {
        expect().assertFail();
        done();
      }
    } else {
      expect().assertFail();
      done();
    }
  });
}

export default function flagstartwithouttipstest() {
  describe('FlagsSartWithoutTipsTest', () => {
    beforeAll(async (done: Function) => {
      context = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      console.log('ishave ishave driver', !!driver);
      await checkAppSelectorExist();
      console.info("isAppSelectorExist " + isAppSelectorExist);
      done();
    })

    afterEach(async () => {
      let cmd = 'aa force-stop ' + selectorBundleName;
      selectorBundleName && await abilityDelegator.executeShellCommand(cmd).catch((error: BusinessError) => {
        console.log("====>aa force stop executeShellCommand error : " + JSON.stringify(error));
        selectorBundleName = '';
      });
      await driver.delayMs(1000);
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0100
     * @tc.name: Verify that the implicit startup application does not set flags and does not match the display popup
     * @tc.desc: A pop-up dialog box
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level 0
     */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0100', Level.LEVEL0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0100';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      let wantInfo: Want = {
        action: 'action.want.notability.notability'
      };
      try {
        await context.startAbility(wantInfo)
          .then(() => {
            hilog.info(0x0000, TAG, 'startAbility success');
          })
          .catch((error: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s startAbility error', JSON.stringify(error));
            expect(error.code == 16000019).assertTrue();
          })
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s startAbility error', JSON.stringify(error));
      }
      // Wait for the popup to open
      await driver.delayMs(2000);
      if (!isAppSelectorExist) {
        done();
        return;
      }
      await judgeDialog(done);
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0200
     * @tc.name: Verify that the implicit startup application sets flags and does not display pop-ups if they do not match
     * @tc.desc: No information dialog box is displayed
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level 0
     */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0200', Level.LEVEL0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0200';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      let wantInfo: Want = {
        action: 'action.want.notability.notability',
        flags: wantConstant.Flags.FLAG_START_WITHOUT_TIPS,
      }
      try {
        await context.startAbility(wantInfo);
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s startAbility error', JSON.stringify(error));
      }
      await driver.delayMs(2000);
      let textComponent = await driver.findComponent(ON.id('TEST_PAGE_TEXT'));
      expect(!!textComponent).assertTrue();
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0500
     * @tc.name: Verify that the implicit startup service does not set flags and does not display pop-ups
     * @tc.desc: Pop-up selection box
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level 3
    */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0500', Level.LEVEL0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0500';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      let wantInfo: Want = {
        action: 'com.acts.two.ability'
      };
      try {
        await context.startAbility(wantInfo);
        await driver.delayMs(2000);
        let textComponent = await driver.findComponent(ON.text('允许'));
        await textComponent?.click();
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s startAbility error', JSON.stringify(error));
      }
      // Wait for the popup to open
      await driver.delayMs(3000);
      if (!isAppSelectorExist) {
        done();
        return;
      }
      await judgeDialog(done);
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0600
     * @tc.name: Verify that the implicit startup service sets flags and does not display pop-ups if they do not match
     * @tc.desc: Pop-up selection box
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level 3
     */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0600', Level.LEVEL0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0600';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      let wantInfo: Want = {
        action: 'com.acts.two.ability',
        flags: wantConstant.Flags.FLAG_START_WITHOUT_TIPS,
      };
      try {
        await context.startAbility(wantInfo);
        await driver.delayMs(2000);
        let textComponent = await driver.findComponent(ON.text('允许'));
        await textComponent?.click();
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s startAbility error', JSON.stringify(error));
      }
      // Wait for the popup to open
      await driver.delayMs(3000);
      if (!isAppSelectorExist) {
        done();
        return;
      }
      await judgeDialog(done);
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0700
     * @tc.name: Verify that the implicit startup application does not set flags and matches one that opens directly
     * @tc.desc: Pull the matching UIAbility directly
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level 3
     */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0700', Level.LEVEL0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0700';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      await abilityDelegator.executeShellCommand('aa start -b com.acts.flagstartwithouttipstest -a TestAbility');
      await driver.delayMs(2000);
      try {
        let wantInfo: Want = {
          action: 'ohos.want.onlyforwithouttips.onlyforwithouttips',
        }
        await context.startAbility(wantInfo);
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s startAbility error', JSON.stringify(error));
      }
      await driver.delayMs(2000);
      let openViewData = false;
      try {
        await driver.findComponent(ON.text('ohos.want.action.viewData ability')).then(async (data) => {
          hilog.info(0x0000, TAG, 'text at this success %{public}s ', JSON.stringify(data));
          openViewData = true;
          await driver.delayMs(100);
          !!data?.click && await data?.click();
        }).catch(() => {
          hilog.info(0x0000, TAG, '%{public}s', 'findComponent failed');
        })
      } catch (error) {
        hilog.info(0x0000, TAG, 'text at it failed %{public}s', error?.message);
        expect().assertFail();
        done();
      }
      expect(openViewData).assertTrue();
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_startAbility_FLAG_0800
     * @tc.name: Verify that the implicit startup application sets flags and matches one that opens directly
     * @tc.desc: Pull the matching UIAbility directly
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level 3
     */
    it('SUB_Ability_AbilityRuntime_startAbility_FLAG_0800', Level.LEVEL0, async (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_startAbility_FLAG_0800';
      hilog.info(0x0000, TAG, '%{public}s', '--start');
      await abilityDelegator.executeShellCommand('aa start -b com.acts.flagstartwithouttipstest -a TestAbility');
      await driver.delayMs(2000);
      try {
        let wantInfo: Want = {
          action: 'ohos.want.onlyforwithouttips.onlyforwithouttips',
          flags: wantConstant.Flags.FLAG_START_WITHOUT_TIPS,
        }
        await context.startAbility(wantInfo);
      } catch (error) {
        hilog.info(0x0000, TAG, '%{public}s startAbility error', JSON.stringify(error));
      }
      await driver.delayMs(2000);
      let openViewData = false;
      try {
        await driver.findComponent(ON.text('ohos.want.action.viewData ability')).then(async (data) => {
          hilog.info(0x0000, TAG, 'text at this success %{public}s ', JSON.stringify(data));
          openViewData = true;
          await driver.delayMs(100);
          !!data?.click && await data?.click();
        }).catch(() => {
          hilog.info(0x0000, TAG, '%{public}s', 'findComponent failed');
        })
      } catch (error) {
        hilog.info(0x0000, TAG, 'text at it failed %{public}s', error?.message);
        expect().assertFail();
        done();
      }
      expect(openViewData).assertTrue();
      done();
    })
  })
}