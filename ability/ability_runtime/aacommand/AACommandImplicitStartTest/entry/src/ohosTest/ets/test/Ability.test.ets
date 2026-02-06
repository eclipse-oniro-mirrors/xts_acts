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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

async function cancelSuspendDelay() {
  hilog.info(0x0000, 'aaimplicitstarttest', '%{public}s', 'cancelSuspendDelay delayId ' + globalThis.delayId);
  backgroundTaskManager.cancelSuspendDelay(globalThis.delayId);
}

function sleep(time:number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

export default function aaImplicitStartTest() {
  describe('AACommandImplicitStartTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {})
    beforeEach(async () => {
      await abilityDelegator.executeShellCommand('hilog -r').then(data => {
        hilog.info(0x0000, 'aaimplicitstarttest', '%{public}s',
          'beforeEach AACommandImplicitStartTest hilog -r data is: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        hilog.info(0x0000, 'aaimplicitstarttest', '%{public}s',
          'beforeEach AACommandImplicitStartTest hilog -r err is: ' + JSON.stringify(err));
      });
      await sleep(800);
    })
    afterEach(() => {})
    afterAll(async () => {
      await cancelSuspendDelay();
    })

    /*
    * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0100
    * @tc.name    check aa explicit start is okay
    * @tc.desc    "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility" is successful
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0100', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility').then(data => {
        res = data.stdResult;
      }).catch((err:BusinessError) => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0100 err is: ' + JSON.stringify(err));
      })
      expect(res).assertContain('start ability successfully.');
      done();
    })

    /*
    * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0200
    * @tc.name    check aa implicit start by URI and type
    * @tc.desc    running "aa start -U "https:://uri.aacommandimplicitstarttest.home" -t uri-type" is successful
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0200', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -U "https://uri.aacommandimplicitstarttest.com" -t uri-type').then(data => {
        res = data.stdResult;
      }).catch((err:BusinessError) => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0200 err is: ' + JSON.stringify(err));
      })
      expect(res).assertContain('start ability successfully.');
      done();
    })

    /*
    * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0300
    * @tc.name    check aa implicit start by action
    * @tc.desc    running 'aa start -A "action.aacommandimplicitstarttest.home"' is successful
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0300', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -A "action.aacommandimplicitstarttest.home"').then(data => {
        res = data.stdResult;
      }).catch((err:BusinessError) => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0300 err is: ' + JSON.stringify(err));
      })
      expect(res).assertContain('start ability successfully.');
      done();
    })

    /*
    * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0400
    * @tc.name    check aa implicit start by entity
    * @tc.desc    running 'aa start -e "entity.aacommandimplicitstarttest.home"' is successful
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0400', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -e "entity.aacommandimplicitstarttest.home"').then(data => {
        res = data.stdResult;
      }).catch((err:BusinessError) => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0400 err is: ' + JSON.stringify(err));
      })
      expect(res).assertContain('start ability successfully.');
      done();
    })

    /*
    * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0500
    * @tc.name    check aa start -h
    * @tc.desc    running "aa start -h" is successful
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0500', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -h').then(data => {
        res = data.stdResult;
      }).catch((err:BusinessError) => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0500 err is: ' + JSON.stringify(err));
      })
      expect(res).assertContain('[-a <ability-name> -b <bundle-name>]');
      expect(res).assertContain('[--ps <key> <string-value>]');
      expect(res).assertContain('[--pi <key> <integer-value>]');
      expect(res).assertContain('[--pb <key> <boolean-value>]');
      expect(res).assertContain('[--psn <key>]');
      expect(res).assertContain('[-A <action-name>]');
      expect(res).assertContain('[-U <URI>]');
      expect(res).assertContain('[-e <entity>]');
      expect(res).assertContain('[-R]');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0600
     * @tc.name    check aa implicit start by URI with missing parameter
     * @tc.desc    running "aa start -U" ends up with error
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0600', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -U')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0600 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0600 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0700
     * @tc.name    check aa implicit start by action with missing parameter
     * @tc.desc    running "aa start -A" ends up with error
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0700', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -A')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0700 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0700 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0800
     * @tc.name    check aa implicit start by entity with missing parameter
     * @tc.desc    running "aa start -e" ends up with error
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0800', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -e')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0800 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0800 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0900
     * @tc.name    check aa implicit start by type with missing parameter
     * @tc.desc    running "aa start -t" ends up with error
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0900', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -t')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0900 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_0900 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1000
     * @tc.name    check aa start with parameters
     * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kinteger 13
     * --pb kbool1 true --pb kbool2 f --ps kstring1 value1 --ps string2 value2 --psn knullstring1 --psn knullstring2" is successful
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1000', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kinteger 13 --pb kbool1 true --pb kbool2 f --ps kstring1 value1 --ps string2 value2 --psn knullstring1 --psn knullstring2').then(data => {
        res = data.stdResult;
      }).catch((err:BusinessError) => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1000 err is: ' + JSON.stringify(err));
      })
      expect(res).assertContain('start ability successfully.');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1100
     * @tc.name    check aa start with missing parameter
     * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi" ends up with error
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1100', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1100 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1100 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1200
     * @tc.name    check aa start with missing parameter
     * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kinteger" is successful
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1200', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kinteger')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1200 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1200 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid number of parameters for option --pi');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1300
     * @tc.name    check aa start with invalid parameter
     * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kinteger invalidnum" ends up with error
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1300', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kinteger invalidnum')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1300 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1300 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid parameter');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1400
     * @tc.name    check aa start with missing parameter
     * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb" ends up with error
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1400', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1400 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1400 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1500
     * @tc.name    check aa start with missing parameter
     * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool" wnds up with error
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1500', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbbol')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1500 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1500 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid number of parameters for option --pb');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1600
     * @tc.name    check aa start with invalid parameter
     * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kbool invalidbool" ends up with error
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1600', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kbool invalidbool')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1600 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1600 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid parameter');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1700
     * @tc.name    check aa start with missing parameter
     * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --ps" ends up with error
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1700', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --ps')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1700 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1700 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1800
     * @tc.name    check aa start with missing parameter
     * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --ps kstring" ends up with error
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1800', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --ps kstring')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1800 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1800 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid number of parameters for option --ps');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1900
     * @tc.name    check aa start with invalid number of parameters
     * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --ps kstring value1 value2" ends up with error
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1900', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --ps kstring value1 value2')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1900 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_1900 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid number of parameters for option --ps');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2000
     * @tc.name    check aa start with invalid number of parameters
     * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --psn knullstring value" ends up with error
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2000', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --psn knullstring value')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2000 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2000 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid number of parameters for option --psn');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })


    /*
     * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2100
     * @tc.name    check aa start with invalid number of parameters
     * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kinteger 100 200" ends up with error
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2100', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pi kinteger 100 200')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2100 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2100 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid number of parameters for option --pi');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })

    /*
     * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2200
     * @tc.name    check aa start with invalid number of parameters
     * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool true false" ends up with error
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2200', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool true false')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2200 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2200 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('invalid number of parameters for option --pb');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })

    /*
    * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2300
    * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool True" is successful
    * @tc.name    check --pb value case sense
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   3
    */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2300', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool TRUE')
        .then(data => {
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2300 err is: ' + JSON.stringify(err));
        })

      expect(res).assertContain('start ability successfully.');
      done();
    })


    /*
    * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2400
    * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool T" is successful
    * @tc.name    check --pb value case sense
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   3
    */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2400', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool T')
        .then(data => {
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2400 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully.');
      done();
    })


    /*
    * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2500
    * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool True" is successful
    * @tc.name    check --pb value case sense
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   3
    */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2500', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool True')
        .then(data => {
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2500 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully.');
      done();
    })


    /*
    * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2600
    * @tc.name    check --pb value case sense
    * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool FALSE" is successful
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   3
    */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2600', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool FALSE')
        .then(data => {
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2600 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully.');
      done();
    })


    /*
    * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2700
    * @tc.name    check --pb value case sense
    * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool False" is successful
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   3
    */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2700', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool False')
        .then(data => {
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2700 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully.');
      done();
    })


    /*
    * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2800
    * @tc.name    check --pb value case sense
    * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool false" is successful
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   3
    */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2800', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool false')
        .then(data => {
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2800 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully.');
      done();
    })


    /*
    * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2900
    * @tc.name    check --pb value case sense
    * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool F" is successful
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   3
    */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2900', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool F')
        .then(data => {
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_2900 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully.');
      done();
    })


    /*
    * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_3000
    * @tc.name    check --pb value case sense
    * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool f" is successful
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   3
    */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_3000', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a EntryAbility --pb kbool f')
        .then(data => {
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_3000 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('start ability successfully.');
      done();
    })


    /*
    * @tc.number  SUB_Ability_AbilityTools_AACommand_AAImplicitStart_3100
    * @tc.name    check aa start unexported ability
    * @tc.desc    running "aa start -b com.example.aacommandimplicitstarttest -a UnexportedAbility" is unsuccessful
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   3
    */
    it('SUB_Ability_AbilityTools_AACommand_AAImplicitStart_3100', Level.LEVEL1, async (done: Function) => {
      let res:string = "";
      await abilityDelegator.executeShellCommand('aa start -b com.example.aacommandimplicitstarttest -a UnexportedAbility')
        .then(data => {
          res = data.stdResult;
        }).catch((err:BusinessError) => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_Ability_AbilityTools_AACommand_AAImplicitStart_3100 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: failed to start ability.');
      expect(res).assertContain('Failed to verify the visibility of the target ability.');
      done();
    })
  })
}