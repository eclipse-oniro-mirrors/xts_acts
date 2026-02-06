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
import hilog from '@ohos.hilog'
import Utils from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessError } from '@ohos.base';
import AbilityStage from "@ohos.app.ability.AbilityStage"
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';
let addMonitor = false;
let removeMonitor = false;
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let AbilityStageContext: common.AbilityStageContext

export default function AbilityStageContextStatic() {
  describe('AbilityStageContextStatic', () => {

    beforeAll(async() => {
      hilog.info(domain, tag, 'beforeAll start');
      let driver = Driver.create();
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
          console.error('findComponent failed: ' + JSON.stringify(err));
      }
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.stagecontexttest.static")
      await Utils.msSleep(2000);
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.name   AbilityStageContextStatic001
     * @tc.number ABILITY_TEST_COLORMODE_Static_0100
     * @tc.desc   test filed of AbilityStageContext.currentHapModuleInfo and AbilityStageContext.config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AbilityStageContextStatic001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      AbilityStageContext = AppStorage.get<common.AbilityStageContext>("AbilityStageContext") as common.AbilityStageContext
      hilog.info(domain, tag, 'AbilityStageContextStatic001 info ' + JSON.stringify(AbilityStageContext));
      try {
        hilog.info(domain, tag, 'AbilityStageContextStatic001 info ' + JSON.stringify(AbilityStageContext));
        if (AbilityStageContext) {
          expect(AbilityStageContext != null).assertTrue();
          let abilityInfo = AbilityStageContext.currentHapModuleInfo;
          hilog.info(domain, tag, 'AbilityStageContextStatic001 info ' + JSON.stringify(abilityInfo));
          expect(abilityInfo != null).assertTrue();
          hilog.info(domain, tag, `AbilityStageContextStatic001 abilityInfo.name: ` + abilityInfo.name);
          expect(abilityInfo.name == "entry").assertTrue();
          hilog.info(domain, tag, `AbilityStageContextStatic001 abilityInfo.icon: ` + abilityInfo.icon);
          expect(abilityInfo.icon == "$media:layered_image").assertTrue();
          hilog.info(domain, tag, `AbilityStageContextStatic001 abilityInfo.iconId: ` + abilityInfo.iconId);
          expect(typeof (abilityInfo.iconId) == 'long').assertTrue();
          hilog.info(domain, tag, `AbilityStageContextStatic001 abilityInfo.label: ` + abilityInfo.label);
          expect(abilityInfo.label == "$string:EntryAbility_label").assertTrue();
          hilog.info(domain, tag, `AbilityStageContextStatic001 abilityInfo.labelId: ` + abilityInfo.labelId);
          expect(typeof (abilityInfo.labelId) == 'long').assertTrue();
          hilog.info(domain, tag, `AbilityStageContextStatic001 abilityInfo.description: ` + abilityInfo.description);
          expect(abilityInfo.description == "$string:module_desc").assertTrue();
          hilog.info(domain, tag, `AbilityStageContextStatic001 abilityInfo.descriptionId: ` + abilityInfo.descriptionId);
          expect(typeof (abilityInfo.descriptionId) == 'long').assertTrue();
          hilog.info(domain, tag, `AbilityStageContextStatic001 abilityInfo.mainElementName: ` + abilityInfo.mainElementName);
          expect(abilityInfo.mainElementName == "EntryAbility").assertTrue();
          hilog.info(domain, tag, `AbilityStageContextStatic001 abilityInfo.metadata: ` + abilityInfo.metadata.length);
          expect(abilityInfo.metadata.length >= 0).assertTrue();

          let config = AbilityStageContext.config
          hilog.info(domain, tag, `AbilityStageContextStatic001 config.language: ` + config.language);
          expect(AbilityStageContext.config.language).not().assertUndefined();
          expect(AbilityStageContext.config.language).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContextStatic001 config.colorMode: ` + config.colorMode);
          expect(AbilityStageContext.config.colorMode).not().assertUndefined();
          expect(AbilityStageContext.config.colorMode).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContextStatic001 config.direction: ` + config.direction);
          expect(AbilityStageContext.config.direction).not().assertUndefined();
          expect(AbilityStageContext.config.direction).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContextStatic001 config.screenDensity: ` + config.screenDensity);
          expect(AbilityStageContext.config.screenDensity).not().assertUndefined();
          expect(AbilityStageContext.config.screenDensity).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContextStatic001 config.displayId: ` + config.displayId);
          expect(AbilityStageContext.config.displayId).not().assertUndefined();
          expect(AbilityStageContext.config.displayId).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContextStatic001 config.hasPointerDevice: ` + config.hasPointerDevice);
          expect(AbilityStageContext.config.hasPointerDevice).not().assertUndefined();
          expect(AbilityStageContext.config.hasPointerDevice).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContextStatic001 config.fontId: ` + config.fontId);
          expect(AbilityStageContext.config.fontId).not().assertUndefined();
          expect(AbilityStageContext.config.fontId).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContextStatic001 config.fontSizeScale: ` + config.fontSizeScale);
          expect(AbilityStageContext.config.fontSizeScale).not().assertUndefined();
          expect(AbilityStageContext.config.fontSizeScale).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContextStatic001 config.fontWeightScale: ` + config.fontWeightScale);
          expect(AbilityStageContext.config.fontWeightScale).not().assertUndefined();
          expect(AbilityStageContext.config.fontWeightScale).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContextStatic001 config.mcc: ` + config.mcc);
          expect(AbilityStageContext.config.mcc).not().assertUndefined();
          expect(AbilityStageContext.config.mcc).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContextStatic001 config.mnc: ` + config.mnc);
          expect(AbilityStageContext.config.mnc).not().assertUndefined();
          expect(AbilityStageContext.config.mnc).not().assertNull();
          hilog.info(domain, tag, 'AbilityStageContextStatic001 config.locale: ' + config.locale);
          expect(AbilityStageContext.config.locale).not().assertUndefined();
          expect(AbilityStageContext.config.locale).not().assertNull();
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, 'testAbilityInfoStatic001 fail: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_AA_AbilityStageMonitor_Static_0100
     * @tc.number SUB_AA_AbilityStageMonitor_Static_0100
     * @tc.desc   Verify that the callback form of waitAbilityStageMonitor can get the abilityStage instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AA_AbilityStageMonitor_Static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const itName = 'waitAbilityStageMonitor_callback';
        hilog.info(domain, tag, `${itName} waitAbilityStageMonitor start`);
        abilityDelegator.waitAbilityStageMonitor({
          moduleName: 'entry',
          srcEntrance: './ets/myabilitystage/MyAbilityStage.ets',
        }, (err: BusinessError<void> | null) => {
          hilog.info(domain, tag, `${itName} waitAbilityStageMonitor err ${err?.code}`);
          expect(err?.code).assertEqual(16000100);
          hilog.info(domain, tag, `${itName} waitAbilityStageMonitor end`);
          done()
        })
      })

    /**
     * @tc.name   SUB_AA_AbilityStageMonitor_Static_0200
     * @tc.number SUB_AA_AbilityStageMonitor_Static_0200
     * @tc.desc   Verify that the callback form of waitAbilityStageMonitor can get the abilityStage instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_AA_AbilityStageMonitor_Static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const itName = 'waitAbilityStageMonitor_callback';
        hilog.info(domain, tag, `${itName} waitAbilityStageMonitor start`);
        abilityDelegator.waitAbilityStageMonitor({
          moduleName: 'entry',
          srcEntrance: './ets/myabilitystage/MyAbilityStage.ets',
        }, 100, (err: BusinessError<void> | null) => {
          hilog.info(domain, tag, `${itName} waitAbilityStageMonitor err ${err?.code}`);
          expect(err?.code).assertEqual(16000100);
          hilog.info(domain, tag, `${itName} waitAbilityStageMonitor end`);
          done()
        })
      })

    /**
     * @tc.name   SUB_AA_AbilityStageMonitor_Static_0300
     * @tc.number SUB_AA_AbilityStageMonitor_Static_0300
     * @tc.desc   Verify that the promise form of waitAbilityStageMonitor can get the abilityStage instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AA_AbilityStageMonitor_Static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const itName = 'waitAbilityStageMonitor_promise';
      try {
        abilityDelegator.waitAbilityStageMonitor({
          moduleName: 'entry',
          srcEntrance: './Application/MyAbilityStage.ets',
        }).then(() => {
          hilog.info(domain, tag, `${itName} waitAbilityStageMonitor promise successful`);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `${itName} waitAbilityStageMonitor promise` + err?.code);
          expect(err?.code).assertEqual(16000100);
          done()
        })
      } catch (error) {
        expect().assertFail()
        done()
      }

    })

    /**
     * @tc.name   SUB_AA_AbilityStageMonitor_Static_0400
     * @tc.number SUB_AA_AbilityStageMonitor_Static_0400
     * @tc.desc   Verify that the callback form of waitAbilityStageMonitor can get the abilityStage instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AA_AbilityStageMonitor_Static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const itName = 'waitAbilityStageMonitor_promise';
      let timeout = 100;
      try {
        abilityDelegator.waitAbilityStageMonitor({
          moduleName: 'entry',
          srcEntrance: './Application/MyAbilityStage.ets',
        }, timeout).then(() => {
          hilog.info(domain, tag, `${itName} waitAbilityStageMonitor promise successful`);
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `${itName} waitAbilityStageMonitor promise` + err?.code);
          expect(err?.code).assertEqual(16000100);
          done()
        })
      } catch (error) {
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_AA_AbilityStageMonitor_Static_0700
     * @tc.number SUB_AA_AbilityStageMonitor_Static_0700
     * @tc.desc   Call the promise form of addAbilityStageMonitor to add monitoring,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AA_AbilityStageMonitor_Static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      addMonitor = false;
      removeMonitor = false;
      let stageMonitor: abilityDelegatorRegistry.AbilityStageMonitor = {
        moduleName: 'entry',
        srcEntrance: './ets/Application/MyAbilityStage.ts',
      }
      hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_Static_0700 wait abilityStage");
      await abilityDelegator.addAbilityStageMonitor(stageMonitor).then(() => {
        hilog.info(domain, tag, "stageMonitor addAbilityStageMonitor promise success");
        addMonitor = true;
      }).catch((err: Error): void => {
        hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_Static_0700 addAbilityStageMonitor err: " + JSON.stringify(err));
        expect().assertFail()
        done()
      });
      hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_Static_0700 removeAbilityStageMonitor");
      await abilityDelegator.removeAbilityStageMonitor(stageMonitor).then(() => {
        hilog.info(domain, tag, "stageMonitor addAbilityStageMonitor promise success");
        removeMonitor = true;
      }).catch((err: Error): void => {
        hilog.info(domain, tag,
          "SUB_AA_AbilityStageMonitor_Static_0700 removeAbilityStageMonitor err: " + JSON.stringify(err));
        expect().assertFail()
        done()
      });
      expect(addMonitor).assertTrue();
      expect(removeMonitor).assertTrue();
      done()
    })

    /**
     * @tc.name   SUB_AA_AbilityStageMonitor_Static_0800
     * @tc.number SUB_AA_AbilityStageMonitor_Static_0800
     * @tc.desc   Call the callback form of addAbilityStageMonitor to add monitoring,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AA_AbilityStageMonitor_Static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      addMonitor = false;
      removeMonitor = false;
      let stageMonitor: abilityDelegatorRegistry.AbilityStageMonitor = {
        moduleName: 'entry',
        srcEntrance: './ets/Application/MyAbilityStage.ts',
      }
      hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_Static_0800 wait abilityStage");
      try {
        abilityDelegator.addAbilityStageMonitor(stageMonitor, (err) => {
          hilog.info(domain, tag,"SUB_AA_AbilityStageMonitor_Static_0800 addAbilityStageMonitor callback" + "err: " + err);
          addMonitor = true;
        })
      } catch (error) {
        hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_Static_0800 addAbilityStageMonitor callback err: " + error);
        expect().assertFail()
        done()
      }
      await Utils.msSleep(1000);
      try {
        hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_Static_0800 removeAbilityStageMonitor");
        abilityDelegator.removeAbilityStageMonitor(stageMonitor, (err) => {
          hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_Static_0800 removeAbilityStageMonitor callback" + "err: " + err);
          removeMonitor = true;
        })
      } catch (error) {
        hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_Static_0800 removeAbilityStageMonitor callback err: " + error);
        expect().assertFail()
        done()
      }
      await Utils.msSleep(1000);
      expect(addMonitor).assertTrue()
      expect(removeMonitor).assertTrue()
      done()
    })

    /**
     * @tc.name   addAbilityStageMonitorSyncStatic001
     * @tc.number SUB_AA_AbilityStageMonitorSync_0100
     * @tc.desc   Call the synchronous method of addAbilityStageMonitorSync to add monitoring,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('addAbilityStageMonitorSyncStatic001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      addMonitor = false;
      removeMonitor = false;
      let stageMonitor: abilityDelegatorRegistry.AbilityStageMonitor = {
        moduleName: "entry",
        srcEntrance: "./ets/Application/MyAbilityStage.ts",
      }
      hilog.info(domain, tag, "addAbilityStageMonitorSyncStatic001 wait abilityStage");
      try {
        abilityDelegator.addAbilityStageMonitorSync(stageMonitor);
        hilog.info(domain, tag,"addAbilityStageMonitorSyncStatic001 addAbilityStageMonitorSyce finish");
        addMonitor = true;
      } catch (error) {
        expect().assertFail()
        done()
      }
      try{
        abilityDelegator.removeAbilityStageMonitorSync(stageMonitor);
        hilog.info(domain, tag,"addAbilityStageMonitorSyncStatic001 removeAbilityStageMonitorSync finish");
        removeMonitor = true;
      } catch(error) {
        expect().assertFail()
        done()
      }
      expect(addMonitor).assertTrue()
      expect(removeMonitor).assertTrue()
      done()
    })
  })
}
