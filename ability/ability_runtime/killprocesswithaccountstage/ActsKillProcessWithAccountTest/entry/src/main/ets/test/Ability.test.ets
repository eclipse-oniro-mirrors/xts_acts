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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import appManager from '@ohos.application.appManager';
import osaccount from '@ohos.account.osAccount'

const NULL_ACCOUNT_ID = 102;
const BUNDLE_NAME = 'com.acts.killprocesswithaccountpackage';
const NULL_BUNDLE_NAME = 'com.aaa.bbb';
const SETVALUE = 3000;
const SETVALUECOPY = 1500;
const SLEEPVALUE = 500;

export default function killProcessWithAccountTest() {
  describe('Acts_killProcessWithAccountTest', function () {
    var ACCOUNT_ID;
    var flag = false;
    beforeAll(function() {
      var osAccountManager = osaccount.getAccountManager();
      console.debug("====>get AccountManager finish====");
      osAccountManager.activateOsAccount(100, (err)=>{
        console.debug("====>activateOsAccount localId: 100 err:" + JSON.stringify(err));
        osAccountManager.getOsAccountLocalIdFromProcess((err,data)=>{
          console.debug("====>getOsAccountLocalIdFromProcess" + " err:" + JSON.stringify(err));
          console.debug("====>getOsAccountLocalIdFromProcess" + " data:" + JSON.stringify(data));
          ACCOUNT_ID = data;
          flag = true;
        })
      })
    })
   
    afterEach(async (done) => {
      console.log("ACTS_KillProcessWithAccount afterEach called");
      let wantInfo = {
        bundleName: "com.acts.killprocesswithaccount",
        abilityName: "com.acts.killprocesswithaccount.MainAbility"
      }
      await globalThis.abilityContext.startAbility(wantInfo).then((data) => {
        console.log("ACTS_KillProcessWithAccount startAbility data : " + JSON.stringify(data));
      }).catch((err) => {
        console.log("ACTS_KillProcessWithAccount startAbility err : " + JSON.stringify(err));
      })
      setTimeout(function () {
        console.log("ACTS_KillProcessWithAccount afterEach end");
        done();
      }, 500);
    })

    beforeEach(async (done) => {
      console.log('======>beforeEach  killProcessWithAccountTest<=======' + flag);
      if(flag == false){
        setTimeout(async ()=>{
          await globalThis.abilityContext.startAbilityWithAccount(
            {
              bundleName: 'com.acts.killprocesswithaccountpackage',
              abilityName: 'com.acts.killprocesswithaccountpackage.MainAbility'
            }, ACCOUNT_ID).then(() => {
            console.log(" ====>ACTS_KillProcessWithAccount startability ====> success! ")
          }).catch((error) => {
            console.log(" ====>ACTS_KillProcessWithAccount startability ====> error: " + JSON.stringify(error))
          })
          sleep(500);
          done();
        },1000)
      }else{
        await globalThis.abilityContext.startAbilityWithAccount(
          {
            bundleName: 'com.acts.killprocesswithaccountpackage',
            abilityName: 'com.acts.killprocesswithaccountpackage.MainAbility'
          }, ACCOUNT_ID).then(() => {
          console.log(" ====>ACTS_KillProcessWithAccount startability ====> success! ")
        }).catch((error) => {
          console.log(" ====>ACTS_KillProcessWithAccount startability ====> error: " + JSON.stringify(error))
        })
        sleep(500);
        done();
      }
    })

    function sleep(delay) {
      var start = (new Date()).getTime();
      while((new Date()).getTime() - start < delay) {
        continue;
      }
    }

    function checkRunningProcess(name, dataInfo) {
      for (let i = 0, len = dataInfo.length; i < len; i++) {
        if (dataInfo[i].processName == name) {
          return true;
        }
      }
      return false;
    }

    /**
     * @tc.number: ACTS_KillProcessWithAccount_0100
     * @tc.name: Provide the system interface of the specified user management application.
     * @tc.desc: Validates the ability to stop the specified process for the specified user.
     */
    it('ACTS_KillProcessWithAccount_0100', 0, async function (done) {
      console.debug("====>ACTS_KillProcessWithAccount_0100 start startAbility====>");

      var procrssinfo = await appManager.getProcessRunningInfos()
      console.log('ACTS_KillProcessWithAccount_0100 ==1== getProcessRunningInfos ======> '
      + JSON.stringify(procrssinfo));
      var infores = checkRunningProcess('com.acts.killprocesswithaccountpackage', procrssinfo)
      console.log("====>ACTS_KillProcessWithAccount_0100====>infores = " + infores)
      expect(infores).assertEqual(true);

      appManager.killProcessWithAccount(BUNDLE_NAME, ACCOUNT_ID).then(() => {
          console.log('ACTS_KillProcessWithAccount_0100  ======> ');
      })

      setTimeout(async() => {
        var copyprocrssinfo = await appManager.getProcessRunningInfos()
        console.log('ACTS_KillProcessWithAccount_0100 getProcessRunningInfos ======> '
        + JSON.stringify(copyprocrssinfo));
        var outcopy = checkRunningProcess('com.acts.killprocesswithaccountpackage', copyprocrssinfo)
        console.log("====>ACTS_KillProcessWithAccount_0100====>outcopy = " + outcopy)
        expect(outcopy).assertEqual(false);
        done();
      }, SETVALUE)
    })

    /**
     * @tc.number: ACTS_KillProcessWithAccount_0300
     * @tc.name: Provide the system interface of the specified user management application.
     * @tc.desc: Authentication cannot stop the specified process for the specified user.
     */
    it('ACTS_KillProcessWithAccount_0300', 0, async function (done) {
      console.debug("====>ACTS_KillProcessWithAccount_0300 start startAbility====>");

      var getinfo = await appManager.getProcessRunningInfos()
      console.log('ACTS_KillProcessWithAccount_0300 getProcessRunningInfos =1= ======> '
      + JSON.stringify(getinfo));
      var res = checkRunningProcess('com.acts.killprocesswithaccountpackage', getinfo)
      console.log("====>ACTS_KillProcessWithAccount_0300====>res = " + res)
      expect(res).assertEqual(true);

      appManager.killProcessWithAccount(NULL_BUNDLE_NAME, ACCOUNT_ID).then(() => {
        console.log('ACTS_KillProcessWithAccount_0300  ======> ');
      })

      setTimeout(async() => {
        var procrssinfo = await appManager.getProcessRunningInfos()
        console.log('ACTS_KillProcessWithAccount_0300 ==1== getProcessRunningInfos ======> '
        + JSON.stringify(procrssinfo));
        var infores = checkRunningProcess('com.acts.killprocesswithaccountpackage', procrssinfo)
        console.log("====>ACTS_KillProcessWithAccount_0300====>infores = " + infores)
        expect(infores).assertEqual(true);

        await appManager.killProcessWithAccount(BUNDLE_NAME, ACCOUNT_ID).then(async() => {
          console.log('ACTS_KillProcessWithAccount_0300 killProcess ======> start');
          sleep(SLEEPVALUE)
          var copyprocrssinfo = await appManager.getProcessRunningInfos()
          console.log('ACTS_KillProcessWithAccount_0300 getProcessRunningInfos ======> '
          + JSON.stringify(copyprocrssinfo));
          var outcopy = checkRunningProcess('com.acts.killprocesswithaccountpackage', copyprocrssinfo)
          console.log("====>ACTS_KillProcessWithAccount_0300====> outcopy = " + outcopy)
          expect(outcopy).assertEqual(false);
          done();
        })
      }, SETVALUECOPY)
    })

    /**
     * @tc.number: ACTS_KillProcessWithAccount_0400
     * @tc.name: Provide the system interface of the specified user management application.
     * @tc.desc: Authentication cannot stop the specified process for the specified user.
     */
    it('ACTS_KillProcessWithAccount_0400', 0, async function (done) {
      console.debug("====>ACTS_KillProcessWithAccount_0400 start startAbility====>");

      var getinfo = await appManager.getProcessRunningInfos()
      console.log('ACTS_KillProcessWithAccount_0400 getProcessRunningInfos =1= ======> ' + JSON.stringify(getinfo));
      var res = checkRunningProcess('com.acts.killprocesswithaccountpackage', getinfo)
      console.log("====>ACTS_KillProcessWithAccount_0400====>res = " + res)
      expect(res).assertEqual(true);

      appManager.killProcessWithAccount(BUNDLE_NAME, NULL_ACCOUNT_ID).then(() => {
        console.log('ACTS_KillProcessWithAccount_0400 killProcess ======> start');
      })

      setTimeout(async() => {
        var procrssinfo = await appManager.getProcessRunningInfos()
        console.log('ACTS_KillProcessWithAccount_0400 ==1== getProcessRunningInfos ======> '
        + JSON.stringify(procrssinfo));
        var infores = checkRunningProcess('com.acts.killprocesswithaccountpackage', procrssinfo)
        console.log("====>ACTS_KillProcessWithAccount_0400====>infores = " + infores)
        expect(infores).assertEqual(true);

        appManager.killProcessWithAccount(BUNDLE_NAME, ACCOUNT_ID).then(async() => {
          console.log('ACTS_KillProcessWithAccount_0400 killProcess2 ======> start');

        sleep(SLEEPVALUE)
        var copyprocrssinfo = await appManager.getProcessRunningInfos()
        console.log('ACTS_KillProcessWithAccount_0400 ==2== getProcessRunningInfos ======> '
        + JSON.stringify(copyprocrssinfo));
        var out = checkRunningProcess('com.acts.killprocesswithaccountpackage', copyprocrssinfo)
        console.log("====>ACTS_KillProcessWithAccount_0400====>infores = " + out)
        expect(out).assertEqual(false);
        done();
        })
      }, SETVALUECOPY)
    })

    /**
     * @tc.number: ACTS_KillProcessWithAccount_0500
     * @tc.name: Provide the system interface of the specified user management application.
     * @tc.desc: Validates the ability to stop the specified process for the specified user.
     */
    it('ACTS_KillProcessWithAccount_0500', 0, async function (done) {
      console.debug("====>ACTS_KillProcessWithAccount_0500 start startAbility====>");

      var procrssinfo = await appManager.getProcessRunningInfos()
      console.log('ACTS_KillProcessWithAccount_0500 ==1== getProcessRunningInfos ======> '
      + JSON.stringify(procrssinfo));
      var infores = checkRunningProcess('com.acts.killprocesswithaccountpackage', procrssinfo)
      console.log("====>ACTS_KillProcessWithAccount_0500====>infores = " + infores)
      expect(infores).assertEqual(true);

      await appManager.killProcessWithAccount(BUNDLE_NAME, ACCOUNT_ID,(async() => {
        console.log('ACTS_KillProcessWithAccount_0500 killProcess ======> start');
      }))

      setTimeout(async() => {
        var copyprocrssinfo = await appManager.getProcessRunningInfos()
        console.log('ACTS_KillProcessWithAccount_0500 getProcessRunningInfos ======> '
        + JSON.stringify(copyprocrssinfo));
        var outcopy = checkRunningProcess('com.acts.killprocesswithaccountpackage', copyprocrssinfo)
        console.log("====>ACTS_KillProcessWithAccount_0500====>outcopy = " + outcopy)
        expect(outcopy).assertEqual(false);
        done();
      }, SETVALUE)
    })

    /**
     * @tc.number: ACTS_KillProcessWithAccount_0700
     * @tc.name: Provide the system interface of the specified user management application.
     * @tc.desc: Authentication cannot stop the specified process for the specified user.
     */
    it('ACTS_KillProcessWithAccount_0700', 0, async function (done) {
      console.debug("====>ACTS_KillProcessWithAccount_0700 start startAbility====>");

      var getinfo = await appManager.getProcessRunningInfos()
      console.log('ACTS_KillProcessWithAccount_0700 getProcessRunningInfos =1= ======> '
      + JSON.stringify(getinfo));
      var res = checkRunningProcess('com.acts.killprocesswithaccountpackage', getinfo)
      console.log("====>ACTS_KillProcessWithAccount_0700====>res = " + res)
      expect(res).assertEqual(true);

      appManager.killProcessWithAccount(NULL_BUNDLE_NAME,ACCOUNT_ID,(() => {
        console.log('ACTS_KillProcessWithAccount_0700 killProcess ======> start');
      }))

      setTimeout(async() => {
        var procrssinfo = await appManager.getProcessRunningInfos()
        console.log('ACTS_KillProcessWithAccount_0700 ==1== getProcessRunningInfos ======> '
        + JSON.stringify(procrssinfo));
        var infores = checkRunningProcess('com.acts.killprocesswithaccountpackage', procrssinfo)
        console.log("====>ACTS_KillProcessWithAccount_0700====>infores = " + infores)
        expect(infores).assertEqual(true);

        await appManager.killProcessWithAccount(BUNDLE_NAME, ACCOUNT_ID).then(async() => {
          console.log('ACTS_KillProcessWithAccount_0700 killProcess ======> start');
          sleep(SLEEPVALUE)
          var copyprocrssinfo = await appManager.getProcessRunningInfos()
          console.log('ACTS_KillProcessWithAccount_0700 getProcessRunningInfos ======> '
          + JSON.stringify(copyprocrssinfo));
          var outcopy = checkRunningProcess('com.acts.killprocesswithaccountpackage', copyprocrssinfo)
          console.log("====>ACTS_KillProcessWithAccount_0700====> outcopy = " + outcopy)
          expect(outcopy).assertEqual(false);
          done();
        })
      }, SETVALUECOPY)
    })

    /**
     * @tc.number: ACTS_KillProcessWithAccount_0800
     * @tc.name: Provide the system interface of the specified user management application.
     * @tc.desc: Authentication cannot stop the specified process for the specified user.
     */
    it('ACTS_KillProcessWithAccount_0800', 0, async function (done) {
      console.debug("====>ACTS_KillProcessWithAccount_0800 start startAbility====>");

      var getinfo = await appManager.getProcessRunningInfos()
      console.log('ACTS_KillProcessWithAccount_0800 getProcessRunningInfos =1= ======> '
      + JSON.stringify(getinfo));
      var res = checkRunningProcess('com.acts.killprocesswithaccountpackage', getinfo)
      console.log("====>ACTS_KillProcessWithAccount_0800====>res = " + res)
      expect(res).assertEqual(true);

      appManager.killProcessWithAccount(BUNDLE_NAME, NULL_ACCOUNT_ID,(() => {
        console.log('ACTS_KillProcessWithAccount_0800 killProcess ======> start');
      }))

      setTimeout(async() => {
        var procrssinfo = await appManager.getProcessRunningInfos()
        console.log('ACTS_KillProcessWithAccount_0800 ==1== getProcessRunningInfos ======> '
        + JSON.stringify(procrssinfo));
        var infores = checkRunningProcess('com.acts.killprocesswithaccountpackage', procrssinfo)
        console.log("====>ACTS_KillProcessWithAccount_0800====>infores = " + infores)
        expect(infores).assertEqual(true);

        await appManager.killProcessWithAccount(BUNDLE_NAME, ACCOUNT_ID).then(async() => {
          console.log('ACTS_KillProcessWithAccount_0800 killProcess ======> start');
          sleep(SLEEPVALUE)
          var copyprocrssinfo = await appManager.getProcessRunningInfos()
          console.log('ACTS_KillProcessWithAccount_0800 getProcessRunningInfos ======> '
          + JSON.stringify(copyprocrssinfo));
          var outcopy = checkRunningProcess('com.acts.killprocesswithaccountpackage', copyprocrssinfo)
          console.log("====>ACTS_KillProcessWithAccount_0800====> outcopy = " + outcopy)
          expect(outcopy).assertEqual(false);
          done();
        })
      }, SETVALUECOPY)
    })

  })
};
