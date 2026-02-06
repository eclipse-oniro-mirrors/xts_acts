/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, afterEach, beforeAll, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import bundle from '@ohos.bundle.bundleManager';
import Utils from './Util.test';
import Want from '@ohos.app.ability.Want';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
let targetVersion:number;
let tag = "testTag"
export default function abilityDelegatorStage() {
  describe('abilityDelegatorStage', () => {
    beforeAll(async() => {
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start');
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start1');
      await Utils.msSleep(2000)
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start2');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.abilitydelegatortest.static")
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start3');
      await Utils.msSleep(2000)
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll end');
    })


    afterEach(async () => {
      await Utils.msSleep(2500);
    })

    /*
     * @tc.number:SUB_Ability_AbilityTools_AbilityDelegator_Stage_12700
     * @tc.name: SUB_Ability_AbilityTools_AbilityDelegator_Stage_12700
     * @tc.desc:Unable to start specified PageAbility (AsyncCallback)
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_12700', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12700 begin');
      try {
        abilityDelegator.startAbility({
          bundleName: 'com.acts.abilitydelegatortest',
          abilityName: 'abilityName'
        }, (err: BusinessError<void> | null):void => {
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility callback err ' + JSON.stringify(err?.code));
          if (err) {
            expect(err?.code).assertEqual(16000001);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12700 failed ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });

    /*
     * @tc.number:SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800
     * @tc.name: SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800
     * @tc.desc:Unable to start specified PageAbility(Promise)
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800 begin');
      try {
        let want: Want = {
          bundleName: 'com.acts.abilitydelegatortest',
          abilityName: 'abilityName'
        };
        abilityDelegator.startAbility(want).then(():void => {
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility promise');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError):void => {
          hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800 failed');
            expect(err.code).assertEqual(16000001);
          done();
        })
      } catch (error) {
        hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800 failed ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });


    /*
     * @tc.number:SUB_Ability_AbilityTools_AbilityDelegator_Stage_12801
     * @tc.name: SUB_Ability_AbilityTools_AbilityDelegator_Stage_12801
     * @tc.desc:Unable to start specified PageAbility(Promise)
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_12801', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800 begin');
      try {
        let want: Want = {
          bundleName: 'com.acts.abilitydelegatorrely.static',
          abilityName: 'EntryAbility'
        };
        abilityDelegator.startAbility(want).then(():void => {
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility promise');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError):void => {
          hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800 failed');
          expect(err.code).assertEqual(16000004);
          done();
        })
      } catch (error) {
        hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800 failed ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });


    /*
     * @tc.number:SUB_Ability_AbilityTools_AbilityDelegator_Stage_12701
     * @tc.name: SUB_Ability_AbilityTools_AbilityDelegator_Stage_12701
     * @tc.desc:Unable to start specified PageAbility (AsyncCallback)
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_12701', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12700 begin');
      try {
        abilityDelegator.startAbility({
          bundleName: 'com.acts.abilitydelegatorrely.static',
          abilityName: 'EntryAbility'
        }, (err: BusinessError<void> | null):void => {
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility callback err ' + JSON.stringify(err?.code));
          if (err) {
            expect(err?.code).assertEqual(16000004);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12700 failed ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });


    /*
     * @tc.number:SUB_Ability_AbilityTools_AbilityDelegator_Stage_12802
     * @tc.name: SUB_Ability_AbilityTools_AbilityDelegator_Stage_12802
     * @tc.desc:Unable to start specified PageAbility(Promise)
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_12802', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800 begin');
      try {
        let want: Want = {
          bundleName: 'com.acts.abilitydelegatorrely.static',
          abilityName: 'EntryAbility2'
        };
        abilityDelegator.startAbility(want).then(():void => {
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility promise');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError):void => {
          hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800 failed');
          expect(err.code).assertEqual(16000005);
          done();
        })
      } catch (error) {
        hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800 failed ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });


    /*
     * @tc.number:SUB_Ability_AbilityTools_AbilityDelegator_Stage_12702
     * @tc.name: SUB_Ability_AbilityTools_AbilityDelegator_Stage_12702
     * @tc.desc:Unable to start specified PageAbility (AsyncCallback)
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_12702', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12700 begin');
      try {
        abilityDelegator.startAbility({
          bundleName: 'com.acts.abilitydelegatorrely.static',
          abilityName: 'EntryAbility2'
        }, (err: BusinessError<void> | null):void => {
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility callback err ' + JSON.stringify(err?.code));
          if (err) {
            expect(err?.code).assertEqual(16000005);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12700 failed ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });



    /*
     * @tc.number:SUB_Ability_AbilityTools_AbilityDelegator_Stage_12803
     * @tc.name: SUB_Ability_AbilityTools_AbilityDelegator_Stage_12803
     * @tc.desc:Unable to start specified PageAbility(Promise)
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_12803', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800 begin');
      try {
        let want: Want = {};
        abilityDelegator.startAbility(want).then(():void => {
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility promise');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError):void => {
          hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800 failed');
          expect(err.code).assertEqual(16000019);
          done();
        })
      } catch (error) {
        hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800 failed ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });


    /*
     * @tc.number:SUB_Ability_AbilityTools_AbilityDelegator_Stage_12703
     * @tc.name: SUB_Ability_AbilityTools_AbilityDelegator_Stage_12703
     * @tc.desc:Unable to start specified PageAbility (AsyncCallback)
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_12703', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12700 begin');
      try {
        abilityDelegator.startAbility({}, (err: BusinessError<void> | null):void => {
          hilog.info(0x0000, 'testTag EntryAbility', 'startAbility callback err ' + JSON.stringify(err?.code));
          if (err) {
            expect(err?.code).assertEqual(16000019);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12700 failed ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });

  })
}