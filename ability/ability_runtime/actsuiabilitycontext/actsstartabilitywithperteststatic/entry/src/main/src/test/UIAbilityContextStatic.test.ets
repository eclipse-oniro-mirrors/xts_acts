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

import { describe, it, expect, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { image } from '@kit.ImageKit';
import { Driver, ON } from '@ohos.UiTest';

let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let domain: int = 0x0000;
let tag: string = 'testTag';
let context: common.UIAbilityContext | undefined;

let color: ArrayBuffer = new ArrayBuffer(512 * 512 * 4);
let opts: image.InitializationOptions = {editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {height: 512, width: 512}};
let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
let disable = false;

export default function UIAbilityContextStatic() {
  describe('ActsUIAbilityContextStatic', () => {

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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.startabilityforresulttest2.static")
      await Utils.msSleep(2000);
      hilog.info(domain, tag, 'start success');
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_1200
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_1200
     * @tc.desc   API test for context.SetAbilityInstanceInfo with permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "it begin");
      try {
        await context!.setAbilityInstanceInfo('', pixelMap);
        hilog.info(domain, tag, "fail");
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(domain,  tag, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        let code = (err as BusinessError).code;
        expect(code).assertEqual(401);
        hilog.info(domain, tag, "success");
        done();
      }
    })

  })
}
