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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError, RecordData } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import OpenLinkOptions from '@ohos.app.ability.OpenLinkOptions';
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';
let context: common.UIAbilityContext;

let parameters: Record<String, RecordData> = {"demo_key": "demo_value", "demo_num": 111}
let paramOptions: OpenLinkOptions = {
  parameters: parameters
};

export default function openLinkPatchStaticTest() {
  describe('openLinkPatchStaticTest', () => {

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
      hilog.info(domain, tag, "beforeAll start");
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      hilog.info(domain, tag, 'beforeAll abilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.openlinknopermissiontest.static")
      await Utils.msSleep(2000);
      context= AppStorage.get<common.UIAbilityContext>("Context") as common.UIAbilityContext;
      hilog.info(domain, tag, "Context: " + context);
      hilog.info(domain, tag, "beforeAll end");
    });

    /**
     * @tc.name   AbilityRuntime_OpenLink_Static_1100
     * @tc.number SUB_Ability_AbilityRuntime_OpenLink_Static_1100
     * @tc.desc   The input parameter 'link' is legal uri string and target app set permissions,Call the openLink interface through context, open target app failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AbilityRuntime_OpenLink_Static_1100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_OpenLink_Static_1100`;
      hilog.info(domain, tag, 'AbilityRuntime_OpenLink_Static_1100 begin');
      await Utils.msSleep(1000);
      try {
        const link = 'example://www.example1.com';
        context.openLink(link).then(() => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1100 open link successful`);
          expect().assertFail();
          done();
        }).catch((error: Error): void => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1100 open link err: ` + error.code + error.message);
          expect(`${error.code}`).assertEqual('16000005');
          done();
        })
      } catch (err) {
        hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1100 open fail : ` + err.code + err.message);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AbilityRuntime_OpenLink_Static_1200
     * @tc.number SUB_Ability_AbilityRuntime_OpenLink_Static_1200
     * @tc.desc   The input parameter 'link' is legal uri string and target app set permissions,Call the openLink interface through context, open target app failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AbilityRuntime_OpenLink_Static_1200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_OpenLink_Static_1200`;
      hilog.info(domain, tag, 'AbilityRuntime_OpenLink_Static_1200 begin');
      await Utils.msSleep(1000);
      try {
        const link = 'example://www.example1.com';
        context.openLink(link, paramOptions).then(() => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1200 open link successful`);
          expect().assertFail();
          done();
        }).catch((error: Error): void => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1200 open link err: ` + error.code + error.message);
          expect(`${error.code}`).assertEqual('16000005');
          done();
        })
      } catch (err) {
        hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1200 open fail : ` + err.code + err.message);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AbilityRuntime_OpenLink_Static_1300
     * @tc.number SUB_Ability_AbilityRuntime_OpenLink_Static_1300
     * @tc.desc   The input parameter 'link' is legal uri string and target app set permissions,Call the openLink interface through context, open target app failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AbilityRuntime_OpenLink_Static_1300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_OpenLink_Static_1300`;
      hilog.info(domain, tag, 'AbilityRuntime_OpenLink_Static_1300 begin');
      await Utils.msSleep(1000);
      try {
        const link = 'example://www.example1.com';
        context.openLink(link, paramOptions, (err: BusinessError | null, result: common.AbilityResult | undefined) => {
          hilog.info(domain, tag, `openLink callback result: ${JSON.stringify(result?.resultCode)}`);
          hilog.info(domain, tag, `openLink callback result data: ${JSON.stringify(result?.want)}`);
          expect(`${err?.code}`).assertEqual('16000005');
          done();
        }).then(() => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1300 open link successful`);
          expect().assertFail();
          done();
        }).catch((error: Error): void => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1300 open link err: ` + error.code + error.message);
          expect(`${error.code}`).assertEqual('16000005');
          done();
        })
      } catch (err) {
        hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1300 open fail : ` + err.code + err.message);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AbilityRuntime_OpenLink_Static_1400
     * @tc.number SUB_Ability_AbilityRuntime_OpenLink_Static_1400
     * @tc.desc   The input parameter 'link' is legal uri string and target app exist,Call the openLink interface through backgroud context, open target app failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AbilityRuntime_OpenLink_Static_1400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_OpenLink_Static_1400`;
      hilog.info(domain, tag, 'AbilityRuntime_OpenLink_Static_1400 begin');
      context.moveAbilityToBackground()
        .catch((err: Error): void => {
        hilog.info(domain, tag, `moveAbilityToBackground error: ${JSON.stringify(err)}.`)
          if(err?.code == 16000061) {
            done();
          }
        });
      await Utils.msSleep(1000);
      try {
        const link = 'example://www.example.com';
        context.openLink(link).then(() => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1400 open link successful`);
          expect().assertFail();
          done();
        }).catch((error: Error): void => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1400 open link err: ` + error.code + error.message);
          expect(`${error.code}`).assertEqual('201');
          done();
        })
      } catch (err) {
        hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1400 open fail : ` + err.code + err.message);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AbilityRuntime_OpenLink_Static_1500
     * @tc.number SUB_Ability_AbilityRuntime_OpenLink_Static_1500
     * @tc.desc   The input parameter 'link' is legal uri string and target app exist,Call the openLink interface through backgroud context, open target app failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AbilityRuntime_OpenLink_Static_1500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_OpenLink_Static_1500`;
      hilog.info(domain, tag, 'AbilityRuntime_OpenLink_Static_1500 begin');
      context.moveAbilityToBackground()
        .catch((err: Error): void => {
        hilog.info(domain, tag, `moveAbilityToBackground error: ${JSON.stringify(err)}.`)
          if(err?.code == 16000061) {
            done();
          }
        });
      await Utils.msSleep(1000);
      try {
        const link = 'example://www.example.com';
        context.openLink(link, paramOptions).then(() => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1500 open link successful`);
          expect().assertFail();
          done();
        }).catch((error: Error): void => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1500 open link err: ` + error.code + error.message);
          expect(`${error.code}`).assertEqual('201');
          done();
        })
      } catch (err) {
        hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1500 open fail : ` + err.code + err.message);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AbilityRuntime_OpenLink_Static_1600
     * @tc.number SUB_Ability_AbilityRuntime_OpenLink_Static_1600
     * @tc.desc   The input parameter 'link' is legal uri string and target app exist,Call the openLink interface through backgroud context, open target app failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AbilityRuntime_OpenLink_Static_1600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_OpenLink_Static_1600`;
      hilog.info(domain, tag, 'AbilityRuntime_OpenLink_Static_1600 begin');
      context.moveAbilityToBackground()
        .catch((err: Error): void => {
        hilog.info(domain, tag, `moveAbilityToBackground error: ${JSON.stringify(err)}.`)
          if(err?.code == 16000061) {
            done();
          }
        });
      await Utils.msSleep(1000);
      try {
        const link = 'example://www.example.com';
        context.openLink(link, paramOptions, (err: BusinessError | null, result: common.AbilityResult | undefined) => {
          hilog.info(domain, tag, `openLink callback result: ${JSON.stringify(result?.resultCode)}`);
          hilog.info(domain, tag, `openLink callback result data: ${JSON.stringify(result?.want)}`);
          expect(`${err?.code}`).assertEqual('201');
          done();
        }).then(() => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1600 open link successful`);
          expect().assertFail();
          done();
        }).catch((error: Error): void => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1600 open link err: ` + error.code + error.message);
          expect(`${error.code}`).assertEqual('201');
          done();
        })
      } catch (err) {
        hilog.info(domain, tag, `AbilityRuntime_OpenLink_Static_1600 open fail : ` + err.code + err.message);
        expect().assertFail();
        done();
      }
    });
  })
}