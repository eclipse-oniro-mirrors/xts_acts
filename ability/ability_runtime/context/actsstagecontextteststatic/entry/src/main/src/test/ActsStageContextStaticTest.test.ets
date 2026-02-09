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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import application from '@ohos.app.ability.application'
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';
let context:common.UIAbilityContext;

export default function actsStageContextTestStatic() {
  describe('ActsStageContextStaticTest', () => {
    let count1 = 0;
    let count2 = 0;
    let count3 = 0;
    let callback1 = () => {
      hilog.info(domain, tag, '===callback1 called');
      count1++;
    }
    let callback2 = () => {
      hilog.info(domain, tag, '===callback2 called');
      count2++;
    }
    let callback3 = ()=> {
      hilog.info(domain, tag, '===callback3 called');
      count3++;
    }
    beforeEach(() => {
      count1 = 0;
      count2 = 0;
      count3 = 0;
    })

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
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.stage_app.static").then((result: abilityDelegatorRegistry.ShellCmdResult) => {
        hilog.info(domain, tag, `ShellCmdResult stdResult:` + result.stdResult);
        hilog.info(domain, tag, `ShellCmdResult exitCode:` + result.exitCode);
      })
      await Utils.msSleep(2000);
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, `context: ${!!context}`);
      hilog.info(domain, tag, 'beforeAll end');
    })


    /**
     * @tc.name   ACTS_StageContext_Static_1500
     * @tc.number ACTS_StageContext_Static_1500
     * @tc.desc   test CreateModuleContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_StageContext_Static_1500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'ACTS_StageContext_Static_1500 begin');
      try {
        application.createModuleContext(context, 'entry').then((Context: common.Context) => {
          hilog.info(domain, tag, 'createContext success' + JSON.stringify(Context));
          hilog.info(domain, tag, 'createContext area: ' + JSON.stringify(Context.area));
          expect(Context.area + "").assertEqual("1");
          hilog.info(domain, tag, 'createContext applicationInfo.name: ' + JSON.stringify(Context.applicationInfo.name));
          expect(Context.applicationInfo.name + "").assertEqual("com.example.stage_app.static");
          hilog.info(domain, tag, 'createContext cacheDir: ' + JSON.stringify(Context.cacheDir));
          expect(Context.cacheDir + "").assertEqual("/data/storage/el2/base/cache");
          hilog.info(domain, tag, 'createContext tempDir: ' + JSON.stringify(Context.tempDir));
          expect(Context.tempDir + "").assertEqual("/data/storage/el2/base/temp");
          hilog.info(domain, tag, 'createContext filesDir: ' + JSON.stringify(Context.filesDir));
          expect(Context.filesDir + "").assertEqual("/data/storage/el2/base/files");
          hilog.info(domain, tag, 'createContext databaseDir: ' + JSON.stringify(Context.databaseDir));
          expect(Context.databaseDir + "").assertEqual("/data/storage/el2/database");
          hilog.info(domain, tag, 'createContext preferencesDir: ' + JSON.stringify(Context.preferencesDir));
          expect(Context.preferencesDir + "").assertEqual("/data/storage/el2/base/preferences");
          hilog.info(domain, tag, 'createContext stageMode: ' + JSON.stringify(Context.stageMode));
          expect(Context.stageMode + "").assertEqual("true");
          done();
        }).catch((error: Error): void => {
          hilog.info(domain, tag, 'createContext fail' + JSON.stringify(error));
          expect().assertFail();
          done()
        })
      } catch (error) {
        hilog.info(domain, tag, 'createContext fail' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
    });

    /**
     * @tc.name   ACTS_StageContext_Static_1600
     * @tc.number ACTS_StageContext_Static_1600
     * @tc.desc   test CreateModuleContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_StageContext_Static_1600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ACTS_StageContext_Static_1600 begin");
      try {
        application.createModuleContext(context, 'entry').then((Context: common.Context) => {
          hilog.info(domain, tag, 'createContext success');
          hilog.info(domain, tag, 'createContext applicationInfo.name: ' + JSON.stringify(Context.applicationInfo.name));
          expect(Context.applicationInfo.name + "").assertEqual("com.example.stage_app.static");
          done();
        }).catch((error: Error): void => {
          hilog.info(domain, tag, 'createContext fail' + JSON.stringify(error));
          expect().assertFail();
          done()
        })
      } catch (error) {
        hilog.info(domain, tag, 'createContext fail' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
    });

    /**
     * @tc.name   ACTS_StageContext_Static_1700
     * @tc.number ACTS_StageContext_Static_1700
     * @tc.desc   test CreateModuleContext with invalid param to verify the errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_StageContext_Static_1700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'ACTS_StageContext_Static_1700 begin');
      let context: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      try {
        application.createModuleContext(context, 'entrytest').then((Context: common.Context) => {
          hilog.info(domain, tag, 'createContext success');
          hilog.info(domain, tag, 'createContext applicationInfo.name: ' + `${Context.applicationInfo.name}`);
          expect(Context.applicationInfo.name + "").assertEqual("com.example.stage_app.static");
          done();
        }).catch((error: Error): void => {
          hilog.info(domain, tag, 'err: createContext fail');
          expect(error.code).assertEqual(401);
          done()
        })
      } catch (paramError) {
        let code: number = (paramError as BusinessError).code;
        hilog.info(domain, tag, 'createContext fail');
        expect().assertFail();
        done()
      }
    });
    
    /**
     * @tc.name   ACTS_StageContext_Static_0900
     * @tc.number ACTS_StageContext_Static_0900
     * @tc.desc   test EventHub test multiple callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StageContext_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void): Promise<void> => {
      const itName = 'ACTS_StageContext_Static_0900';
      hilog.info(domain, tag, `${itName} start`);
      const eventHub = context.eventHub;
      try {
        eventHub.on('event1', callback1);
        eventHub.on('event1', callback2);
        eventHub.on('event1', callback3);
        eventHub.emit('event1');
        expect(`${count1}`).assertEqual('1');
        expect(`${count2}`).assertEqual('1');
        expect(`${count3}`).assertEqual('1')
        eventHub.off('event1', callback2);
        eventHub.emit('event1', '');
        expect(`${count1}`).assertEqual('2');
        expect(`${count2}`).assertEqual('1');
        expect(`${count3}`).assertEqual('2');
        eventHub.off('event1');
        eventHub.emit('event1');
        expect(`${count1}`).assertEqual('2');
        expect(`${count2}`).assertEqual('1');
        expect(`${count3}`).assertEqual('2');
      } catch(err: BusinessError) {
        hilog.info(domain, tag, `${itName} error code: ${err.code}, msg: ${err.message}`);
      }
      done();
      hilog.info(domain, tag, `${itName} end`);
    })

    /**
     * @tc.name   ACTS_StageContext_Static_1000
     * @tc.number ACTS_StageContext_Static_1000
     * @tc.desc   test EventHub test different events
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StageContext_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_StageContext_Static_1000';
      const eventHub = context.eventHub;
      hilog.info(domain, tag, `${itName} eventHub: ${!!eventHub}`);
      eventHub.on('event1', callback1);
      eventHub.on('event2', callback2);
      eventHub.emit('event1');
      expect(`${count1}`).assertEqual('1');
      expect(`${count2}`).assertEqual('0');
      eventHub.emit('event2');
      expect(`${count1}`).assertEqual('1');
      expect(`${count2}`).assertEqual('1');
      eventHub.off('event1');
      eventHub.emit('event1');
      eventHub.emit('event2');
      expect(`${count1}`).assertEqual('1');
      expect(`${count2}`).assertEqual('2');
      eventHub.off('event2');
      eventHub.emit('event1');
      eventHub.emit('event2');
      expect(`${count1}`).assertEqual('1');
      expect(`${count2}`).assertEqual('2');
      done();
      hilog.info(domain, tag, `${itName} end`);
    })

    /**
     * @tc.name   ACTS_StageContext_Static_1100
     * @tc.number ACTS_StageContext_Static_1100
     * @tc.desc   test EventHub test repeat on/off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StageContext_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_StageContext_Static_1100';
      hilog.info(domain, tag, `${itName} start`);
      const eventHub = context.eventHub;
      eventHub.on('event1', callback1);
      eventHub.on('event1', callback1);
      eventHub.emit('event1');
      expect(`${count1}`).assertEqual('1');
      eventHub.off('event1', callback1);
      eventHub.emit('event1');
      expect(`${count1}`).assertEqual('1');
      eventHub.off('event1', callback1);
      eventHub.emit('event1');
      expect(`${count1}`).assertEqual('1');
      done();
      hilog.info(domain, tag, `${itName} end`);
    })

    /**
     * @tc.name   ACTS_StageContext_Static_1200
     * @tc.number ACTS_StageContext_Static_1200
     * @tc.desc   test EventHub test call off() in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StageContext_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_StageContext_Static_1200';
      hilog.info(domain, tag, `${itName} start`);
      const eventHub = context.eventHub;
      let count = 0;
      let func = () => {
        let callback: () => void;
        callback = () => {
          count++;
          hilog.info(domain, tag, `${itName} callback: ${!!callback}`);
          eventHub.off('event1', callback);
        }
        eventHub.on('event1', callback);
      }
      func();
      func();
      func();
      func();
      eventHub.emit('event1');
      expect(`${count}`).assertEqual('4');
      eventHub.emit('event1');
      expect(`${count}`).assertEqual('4');
      done();
      hilog.info(domain, tag, `${itName} end`);
    })

    /**
     * @tc.name   ACTS_StageContext_Static_1300
     * @tc.number ACTS_StageContext_Static_1300
     * @tc.desc   test EventHub test call off() in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StageContext_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_StageContext_Static_1300';
      hilog.info(domain, tag, `${itName} start`);
      const eventHub = context.eventHub;
      let count = 0;
      let func = () => {
        let callback = () => {
          count++;
          eventHub.off('event1');
        }
        eventHub.on('event1', callback);
      }
      func();
      func();
      func();
      func();
      eventHub.emit('event1');
      expect(`${count}`).assertEqual('4');
      eventHub.emit('event1');
      expect(`${count}`).assertEqual('4');
      done();
      hilog.info(domain, tag, `${itName} end`);
    })

    /**
     * @tc.name   ACTS_StageContext_Static_1400
     * @tc.number ACTS_StageContext_Static_1400
     * @tc.desc   test EventHub test call on/off in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StageContext_Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const itName = 'ACTS_StageContext_Static_1400';
      hilog.info(domain, tag, `${itName} start`);
      const eventHub = context.eventHub;
      let count = 0;
      let func = () => {
        let callback = () => {
          count++;
          eventHub.off('event1', callback1);
          eventHub.on('event1', callback2);
        }
        eventHub.on('event1', callback);
      }
      func();
      eventHub.on('event1', callback1);
      eventHub.emit('event1');
      expect(`${count}`).assertEqual('1');
      expect(`${count1}`).assertEqual('1');
      expect(`${count2}`).assertEqual('0');
      eventHub.emit('event1');
      expect(`${count}`).assertEqual('2');
      expect(`${count1}`).assertEqual('1');
      expect(`${count2}`).assertEqual('1');
      done();
      hilog.info(domain, tag, `${itName} end`);
    })
  })
}
