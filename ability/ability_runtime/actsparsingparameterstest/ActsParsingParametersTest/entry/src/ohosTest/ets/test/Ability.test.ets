/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import hilog from '@ohos.hilog';
import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';

function sleep(ms: number) {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    afterEach(async () => {
      await abilityDelegator.executeShellCommand(
        'pkill -f com.example.actsability')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', '---pkill sucessful---');
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', '---pkill err---');
        });
      await abilityDelegator.executeShellCommand('hilog -r')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', '---cleanlog sucessful---');
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', '---cleanlog err---');
        });
    })

    /*
    * @tc.number  Acts_ParsingParameters_0100
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_0100', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'aabbccdd\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_0100 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_0100 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('aa start <options>');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_0200
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_0200', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile jsperf abcd\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_0200 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_0200 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('aa start <options>');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_0300
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_0300', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profileabdc\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_0300 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'Acts_ParsingParameters_0300 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('aa start <options>');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_0400
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_0400', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'dumpheapabdc\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_0400 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_0400 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('aa start <options>');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_0500
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_0500', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile jsperf asdb1000\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_0500 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_0500 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('aa start <options>');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_0600
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_0600', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile jsperf 1000asdb\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_0600 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_0600 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('aa start <options>');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_0700
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_0700', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile jsperfasdb\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_0700 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_0700 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('aa start <options>');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_0800
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('SUB_AA_ACTS_ParsingParameters_0800', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'dumpheap\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_0800 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_0800 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully');
      done();
    })


    /*
    * @tc.number  Acts_ParsingParameters_0900
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_0900', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_0900 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_0900 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('aa start <options>');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_1000
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_1000', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await sleep(200);
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile nativeperf xxxxxxxxx\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1100 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1100 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully');
      done();
    })
    /*
    * @tc.number  Acts_ParsingParameters_1100
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_1100', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await sleep(200);
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile jsperf 1000\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1100 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1100 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_1200
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_1200', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await sleep(200);
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile jsperf\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1200 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1200 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_1300
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_1300', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await sleep(200);
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile nativeperf xxxxxxxxx jsperf 1000\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1300 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1300 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_1400
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_1400', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await sleep(200);
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile jsperf nativeperf xxxxxxxxx\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1400 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1400 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_1500
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_1500', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await sleep(200);
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile jsperf 1000 nativeperf xxxxxxxxx\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1500 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1500 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_1600
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_1600', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await sleep(200);
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile nativeperf xxxxxxxxxxxxxxxx jsperf\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1600 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1600 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_1700
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_1700', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await sleep(200);
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'sleep 1000\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1700 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1700 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_1800
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_1800', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await sleep(200);
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile jsperf 100\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1800 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1800 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_1900
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_1900', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile jsperf 99\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1900 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_1900 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('aa start <options>');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_2000
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_2000', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile jsperf 5001\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_2000 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_2000 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('aa start <options>');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_2100
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_2100', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile jsperf 50000\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_2100 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_2100 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('aa start <options>');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_2200
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_2200', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await sleep(200);
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile jsperf 5000\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_2200 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_2200 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_2300
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_2300', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await sleep(200);
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile jsperf 4999\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_2300 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_2300 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_2400
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_2400', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'dumpheap abcd\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_2400 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_2400 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('aa start <options>');
      done();
    })

    /*
    * @tc.number  Acts_ParsingParameters_2500
    * @tc.name    Tuning parameter settings
    * @tc.desc    Stage model parsing parameters
    * @tc.level   1
    */
    it('Acts_ParsingParameters_2500', Level.LEVEL0, async (done: Function) => {
      let res: string = ""
      await abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.actsability -p \'profile abcd\'')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_2500 data is: ' + JSON.stringify(data));
          res = JSON.stringify(data);
        })
        .catch((err: BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s', 'Acts_ParsingParameters_2500 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('aa start <options>');
      done();
    })
  })
}