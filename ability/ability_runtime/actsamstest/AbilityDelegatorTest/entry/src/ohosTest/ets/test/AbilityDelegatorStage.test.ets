/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { afterEach, beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { emitter } from '@kit.BasicServicesKit';
import bundle from '@ohos.bundle.bundleManager';

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
let eventData: emitter.EventData = {
  data: {
    "content": "close",
  }
};

let innerEvent: emitter.InnerEvent = {
  eventId: 1,
  priority: emitter.EventPriority.HIGH
};

let targetVersion: number = 12;

export default function abilityDelegatorStage() {
  describe('abilityDelegatorStage', () => {
    beforeAll((done: Function) => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12700 beforeAll');
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).then(data => {
        console.info('getBundleInfoForSelf' + JSON.stringify(data));
        targetVersion = data.targetVersion;
        console.info('getBundleInfoForSelf targetVersion=' + targetVersion);
        done();
      }).catch((err: BusinessError) => {
        console.info('getBundleInfoForSelf fail' + JSON.stringify(err));
        console.info('getBundleInfoForSelf fail targetVersion=' + targetVersion);
        done();
      })
    });

    afterEach(async (done: Function) => {
      emitter.emit(innerEvent, eventData);
      setTimeout(() => {
        console.log('SUB_AA_AbilityStageMonitor afterEach called');
        done();
      }, 1000);
    })

    /*
     * @tc.number:SUB_Ability_AbilityTools_AbilityDelegator_Stage_12700
     * @tc.name: SUB_Ability_AbilityTools_AbilityDelegator_Stage_12700
     * @tc.desc:Unable to start specified PageAbility (AsyncCallback)
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_12700', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12700 begin');
      try {
        abilityDelegator.startAbility({
          bundleName: 'com.acts.abilitydelegatortest',
          abilityName: 'abilityName'
        }, (err: BusinessError, data: void) => {
          console.info('startAbility callback err ' + JSON.stringify(err.code));
          if (err) {
            if (targetVersion >= 20) {
              expect(err.code).assertEqual(16000001);
            } else {
              expect(err.code).assertEqual(2097152);
            }
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
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800 begin');
      try {
        let want: Want = {
          bundleName: 'com.acts.abilitydelegatortest',
          abilityName: 'abilityName'
        };
        abilityDelegator.startAbility(want).then((data: void) => {
          console.info('startAbility promise');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12800 failed');
          if (targetVersion >= 20) {
            expect(err.code).assertEqual(16000001);
          } else {
            expect(err.code).assertEqual(2097152);
          }
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
     * @tc.number:SUB_Ability_AbilityTools_AbilityDelegator_Stage_12900
     * @tc.name: SUB_Ability_AbilityTools_AbilityDelegator_Stage_12900
     * @tc.desc:Unable to obtain background Ability information (Promise)
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_12900', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12900 begin');

      await sleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest',
        abilityName: 'AbilityA'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoa');
        expect(true).assertTrue();
      })

      await sleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest',
        abilityName: 'AbilityB'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemob');
        expect(true).assertTrue();
      });

      await sleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest',
        abilityName: 'AbilityC'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoc');
        expect(true).assertTrue();
      });
      await sleep(1000);
      await abilityDelegator.getCurrentTopAbility().then((ability: UIAbility) => {
        console.info('enter getCurrentTopAbility')
        let context = ability.context;
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12900 getCurrentTopAbility ' +
          JSON.stringify(context.abilityInfo.bundleName));
        let name: string = context.abilityInfo.name;
        expect(name).assertEqual('AbilityC');
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_12900 failed ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      })
    });

    /*
     * @tc.number:SUB_Ability_AbilityTools_AbilityDelegator_Stage_13000
     * @tc.name: SUB_Ability_AbilityTools_AbilityDelegator_Stage_13000
     * @tc.desc:Unable to obtain background Ability information (callback)
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_13000', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_13000 begin');
      await sleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest',
        abilityName: 'AbilityA'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoa');
        expect(true).assertTrue();
      })

      await sleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest',
        abilityName: 'AbilityB'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemob');
        expect(true).assertTrue();
      });

      await sleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest',
        abilityName: 'AbilityC'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoc');
        expect(true).assertTrue();
      });

      await sleep(1000);
      abilityDelegator.getCurrentTopAbility((err: BusinessError, ability: UIAbility) => {
        if (err) {
          hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_13000 callback failed ' + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        } else {
          let context = ability.context;
          hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_13000 getCurrentTopAbility ' +
            JSON.stringify(context.abilityInfo.name));
          let name: string = context.abilityInfo.name;
          expect(name).assertEqual('AbilityC');
          done();
        }
      });
    })

    /*
     * @tc.number:SUB_Ability_AbilityTools_AbilityDelegator_Stage_21900
     * @tc.name: SUB_Ability_AbilityTools_AbilityDelegator_Stage_21900
     * @tc.desc:Can start the specified PageAbility (AsyncCallback)
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_21900', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21900 begin');
      await sleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest',
        abilityName: 'AbilityA'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoa');
        expect(true).assertTrue();
      })
      await sleep(1000);
      abilityDelegator.getCurrentTopAbility((err: BusinessError, ability: UIAbility) => {
        if (err) {
          hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21900 callback failed ' + JSON.stringify(err));
          expect(false).assertEqual(true);
          done();
        } else {
          let context = ability.context;
          hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
            'SUB_Ability_AbilityTools_AbilityDelegator_Stage_21900 getCurrentTopAbility ' +
            JSON.stringify(context.abilityInfo.name));
          expect(context.abilityInfo.name).assertEqual('AbilityA');
          done();
        }
      });
    });

    /*
     * @tc.number:SUB_Ability_AbilityTools_AbilityDelegator_Stage_22000
     * @tc.name: SUB_Ability_AbilityTools_AbilityDelegator_Stage_22000
     * @tc.desc:Can start the specified PageAbility (Promise)
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_22000', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
        'SUB_Ability_AbilityTools_AbilityDelegator_Stage_22000 begin');

      await sleep(1000);
      await abilityDelegator.startAbility({
        bundleName: 'com.acts.abilitydelegatortest',
        abilityName: 'AbilityA'
      }).then((data: void) => {
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s', 'startAbility promise abilitydemoa');
        expect(true).assertTrue();
      })
      await sleep(1000);
      await abilityDelegator.getCurrentTopAbility().then((ability: UIAbility) => {
        console.info('enter getCurrentTopAbility')
        let context = ability.context;
        hilog.info(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_22000 getCurrentTopAbility ' +
          JSON.stringify(context.abilityInfo.name));
        expect(context.abilityInfo.name).assertEqual('AbilityA');
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'abilityDelegatorStageTag', '%{public}s',
          'SUB_Ability_AbilityTools_AbilityDelegator_Stage_22000 failed ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      })
    })
  });
}

let sleep = (ms: number): Promise<void> => {
  return new Promise(resolve => setTimeout(resolve, ms));
}
