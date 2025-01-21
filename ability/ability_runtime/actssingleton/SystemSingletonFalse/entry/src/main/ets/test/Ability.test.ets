
/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
// @ts-nocheck
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
const START_ABILITY_TIMEOUT = 3000;
const ABILITY_TIMEOUT = 5000;
export default function singleusermodelTest() {
  describe('ActsSingleUserTest', function () {
    var user100 = 100
    var user101 = 101
    var user102 = 102

    /**
     *@tc.number: ACTS_SingleUserModel_0500
     *@tc.name: Support singleuser operation mode
     *@tc.desc:When singleuser is false, create an ability page with the current user under the influence of
     * the system
     */
    it('ACTS_SingleUserModel_0500', 0, async function (done) {
      console.log("ACTS_SingleUserModel_0500====>callback start====>");
      console.debug("====>start startAbilityWithAccount====>");
      await globalThis.abilityContext.startAbilityWithAccount(
        {
          bundleName: 'com.singleusermodel.actssingleusertest',
          abilityName: 'SingleUserModel0500'
        }, user100).then(() => {
          console.debug("====>startAbilityWithAccount 500 end====>");
        })
      setTimeout(async () => {
        let abilityDelegator = undefined
        abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let temp
        let cmd = 'aa dump -a'
        await abilityDelegator.executeShellCommand(cmd).then((data) => {
          console.info('executeShellCommand : data : ' + JSON.stringify(data));
          temp = data["stdResult"];
          expect(temp.indexOf("SingleUserModel0500") >= 0).assertTrue()
          console.info('executeShellCommand : data : ' + data.exitCode);
        }).catch((err) => {
          console.info('executeShellCommand : err : ' + JSON.stringify(err));
        })
        cmd = 'aa dump -a -u 0'
        await abilityDelegator.executeShellCommand(cmd).then((data) => {
          console.info('executeShellCommand 0: data : ' + JSON.stringify(data))
          temp = data["stdResult"];
          expect(temp.indexOf("SingleUserModel0500") == -1).assertTrue()
          console.info('executeShellCommand 0: data : ' + data.exitCode);
        }).catch((err) => {
          console.info('executeShellCommand 0: err : ' + JSON.stringify(err));
        })
        console.debug('ACTS_SingleUserModel_0500====>timeout====>');
      }, START_ABILITY_TIMEOUT);
      setTimeout(() => {
        globalThis.ability2Context.terminateSelf();
        console.debug('ACTS_SingleUserModel_0500====>done====>');
        done();
      }, ABILITY_TIMEOUT)
    })

    /**
     *@tc.number: ACTS_SingleUserModel_0600
     *@tc.name: Support singleuser operation mode
     *@tc.desc:When singleuser is false, create an ability page with an existing non-current user under the
     * influence of the system
     */
    it('ACTS_SingleUserModel_0600', 0, async function (done) {
      console.log("ACTS_SingleUserModel_0600====>callback start====>")
      console.debug("====>start startAbilityWithAccount====>");
      await globalThis.abilityContext.startAbilityWithAccount(
        {
          bundleName: 'com.singleusermodel.actssingleusertest',
          abilityName: 'SingleUserModel0600'
        }, user101).then((data) => {
          console.debug("====>startAbilityWithAccount 600 end====>" + data);
        }).catch((err) => {
          console.debug("====>startAbilityWithAccount 600 end====>" + err);
        })

      console.log("ACTS_SingleUserModel_0600====>end====>")
      setTimeout(async () => {
        let abilityDelegator = undefined
        abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let temp
        let cmd = 'aa dump -a -u 101'
        await abilityDelegator.executeShellCommand(cmd).then((data) => {
          console.info('executeShellCommand : data : ' + JSON.stringify(data));
          temp = data["stdResult"];
          expect(temp.indexOf("SingleUserModel0600") == -1).assertTrue()
          console.info('executeShellCommand : data 600: ' + data.exitCode);
        }).catch((err) => {
          console.info('executeShellCommand : err : ' + JSON.stringify(err));
        })
        cmd = 'aa dump -a'
        await abilityDelegator.executeShellCommand(cmd).then((data) => {
          console.info('executeShellCommand : data 600: ' + JSON.stringify(data));
          temp = data["stdResult"];
          expect(temp.indexOf("SingleUserModel0600") == -1).assertTrue()
          console.info('executeShellCommand : data 600: ' + data.exitCode);
        }).catch((err) => {
          console.info('executeShellCommand : err 600: ' + JSON.stringify(err));
        })
        cmd = 'aa dump -a -u 0'
        await abilityDelegator.executeShellCommand(cmd).then((data) => {
          console.info('executeShellCommand 0: data 600: ' + JSON.stringify(data));
          temp = data["stdResult"];
          expect(temp.indexOf("SingleUserModel0600") == -1).assertTrue()
          console.info('executeShellCommand 0: data 600: ' + data.exitCode);
        }).catch((err) => {
          console.info('executeShellCommand 0: err 600: ' + JSON.stringify(err));
        })
        console.debug('ACTS_SingleUserModel_0600====>timeout====>');
      }, START_ABILITY_TIMEOUT);
      setTimeout(() => {
        console.debug('ACTS_SingleUserModel_0600====>done====>');
        done();
      }, ABILITY_TIMEOUT)
    })

    /**
     *@tc.number: ACTS_SingleUserModel_0700
     *@tc.name: Support singleuser operation mode
     *@tc.desc:Create an ability page with an empty user under system influence when singleuser is false
     */
    it('ACTS_SingleUserModel_0700', 0, async function (done) {
      console.log("ACTS_SingleUserModel_0700====>callback start====>");
      console.debug("====>start startAbilityWithAccount====>");
      try {
        await globalThis.abilityContext.startAbilityWithAccount(
          {
            bundleName: 'com.singleusermodel.actssingleusertest',
            abilityName: 'SingleUserModel0700'
          }, null).then((data) => {
            console.debug("====>startAbilityWithAccount 700 end====>" + data);
          }).catch((err) => {
            console.debug("====>startAbilityWithAccount 700 end====>" + err);
          })
      } catch (err) {
        let e = err.toString();
        let errLog = "Invalid input parameter"
        console.debug("====>e====>" + e);
        expect(e.indexOf(errLog) >= 0).assertTrue()
      }
      setTimeout(async () => {
        let abilityDelegator = undefined
        abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let temp
        let cmd = 'aa dump -a'
        await abilityDelegator.executeShellCommand(cmd).then((data) => {
          console.info('executeShellCommand : data : ' + JSON.stringify(data));
          temp = data["stdResult"];
          expect(temp.indexOf("SingleUserModel0700") == -1).assertTrue()
          console.info('executeShellCommand : data : ' + data.exitCode);
        }).catch((err) => {
          console.info('executeShellCommand : err : ' + JSON.stringify(err));
        })
        cmd = 'aa dump -a -u 0'
        await abilityDelegator.executeShellCommand(cmd).then((data) => {
          console.info('executeShellCommand 0: data : ' + JSON.stringify(data));
          temp = data["stdResult"];
          expect(temp.indexOf("SingleUserModel0700") == -1).assertTrue()
          console.info('executeShellCommand 0: data : ' + data.exitCode);
        }).catch((err) => {
          console.info('executeShellCommand 0: err : ' + JSON.stringify(err));
        })
        console.debug('ACTS_SingleUserModel_0700====>timeout====>');
      }, START_ABILITY_TIMEOUT)
      setTimeout(() => {
        console.debug('ACTS_SingleUserModel_0700====>done====>');
        done();
      }, ABILITY_TIMEOUT)
    })

    /**
     *@tc.number: ACTS_SingleUserModel_0800
     *@tc.name: Support singleuser operation mode
     *@tc.desc:Create an ability page with an uncreated user under system influence when singleuser is false
     */
    it('ACTS_SingleUserModel_0800', 0, async function (done) {
      console.log("ACTS_SingleUserModel_0800====>callback start====>");
      console.debug("====>start startAbilityWithAccount====>");
      await globalThis.abilityContext.startAbilityWithAccount(
        {
          bundleName: 'com.singleusermodel.actssingleusertest',
          abilityName: 'SingleUserModel0800'
        }, user102).then((data) => {
          console.debug("====>startAbilityWithAccount 800 end data====>" + data);
        }).catch((err) => {
          console.debug("====>startAbilityWithAccount 800 end err====>" + err);
        })

      setTimeout(async () => {
        console.debug('ACTS_SingleUserModel_0800====>timeout====>');
        let abilityDelegator = undefined
        abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let temp
        let cmd = 'aa dump -a'
        await abilityDelegator.executeShellCommand(cmd).then((data) => {
          console.info('executeShellCommand 0800: data : ' + JSON.stringify(data));
          temp = data["stdResult"];
          expect(temp.indexOf("SingleUserModel0800") == -1).assertTrue()
          console.info('executeShellCommand : data : ' + data.exitCode);
        }).catch((err) => {
          console.info('executeShellCommand 0: err : ' + JSON.stringify(err));
        })
        cmd = 'aa dump -a -u 0'
        await abilityDelegator.executeShellCommand(cmd).then((data) => {
          console.info('executeShellCommand 0: data : ' + JSON.stringify(data))
          temp = data["stdResult"];
          expect(temp.indexOf("SingleUserModel0800") == -1).assertTrue()
          console.info('executeShellCommand 0: data : ' + data.exitCode);
        }).catch((err) => {
          console.info('executeShellCommand 0: err : ' + JSON.stringify(err));
        })
      }, START_ABILITY_TIMEOUT);
      setTimeout(() => {
        console.debug('ACTS_SingleUserModel_0800====>done====>');
        done();
      }, ABILITY_TIMEOUT)
    })

    /**
     *@tc.number: ACTS_SingleUserModel_1300
     *@tc.name: Support singleuser operation mode
     *@tc.desc:Create an ability page with an uncreated user under system influence when singleuser is false
     */
    it('ACTS_SingleUserModel_1300', 0, async function (done) {
      console.log("ACTS_SingleUserModel_1300====>callback start====>");
      console.debug("====>start startAbilityWithAccount====>");
      try {
        await globalThis.abilityContext.startAbilityWithAccount(
          {
            bundleName: 'com.singleusermodel.actssingleusertest',
            abilityName: 'SingleUserModel1300'
          }, undefined).then((data) => {
            console.debug("====>startAbilityWithAccount 1300 end====>" + data);
          }).catch((err) => {
            console.debug("====>startAbilityWithAccount 1300 end====>" + err);
          })
      } catch (err) {
        let e = err.toString();
        let errLog = "Invalid input parameter"
        console.debug("====>e====>" + e);
        expect(e.indexOf(errLog) >= 0).assertTrue()
      }
      setTimeout(async () => {
        let temp
        let cmd = 'aa dump -a'
        let abilityDelegator = undefined
        abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        await abilityDelegator.executeShellCommand(cmd).then((data) => {
          console.info('executeShellCommand : data : ' + JSON.stringify(data));
          temp = data["stdResult"];
          expect(temp.indexOf("SingleUserModel1300") == -1).assertTrue()
          console.info('executeShellCommand : data : ' + data.exitCode);
        }).catch((err) => {
          console.info('executeShellCommand 0: err : ' + JSON.stringify(err));
        })
        cmd = 'aa dump -a -u 0'
        await abilityDelegator.executeShellCommand(cmd).then((data) => {
          console.info('executeShellCommand 0: data : ' + JSON.stringify(data))
          temp = data["stdResult"];
          expect(temp.indexOf("SingleUserModel1300") == -1).assertTrue()
          console.info('executeShellCommand 0: data : ' + data.exitCode);
        }).catch((err) => {
          console.info('executeShellCommand 0: err : ' + JSON.stringify(err));
        })
        console.debug('ACTS_SingleUserModel_1300====>timeout====>');
      }, START_ABILITY_TIMEOUT);
      setTimeout(() => {
        console.debug('ACTS_SingleUserModel_1300====>done====>');
        done();
      }, ABILITY_TIMEOUT)
    })
  })
}