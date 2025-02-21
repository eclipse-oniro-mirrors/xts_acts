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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

import abilityManager from '@ohos.app.ability.abilityManager';
import errorManager from '@ohos.app.ability.errorManager';

function sleep(time) {
  return new Promise((resolve)=>setTimeout(resolve,time));
}

export default function ApiCoverTest() {
  describe('NewApiCoverTestTest', function () {
    afterEach(async (done) => {
      setTimeout(function () {
        done();
      }, 2500);
    })

    /*
     * @tc.number  SUB_AA_ReisterErrorObserver_New_0100
     * @tc.name    Test ReisterErrorObserver.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ReisterErrorObserver_New_0100', 0, async function (done) {
      let errorObserver:errorManager.ErrorObserver;
      errorObserver = {
        onUnhandledException:(errMessage) => {
          console.info("SUB_AA_ReisterErrorObserver_0100" + JSON.stringify(errMessage));
        }
      }
      try {
        let errCodeId = errorManager.on("error", errorObserver)
        expect(errCodeId).assertEqual(0)
        errorManager.off("error", errCodeId).then((data)=>{
          expect(data).assertEqual(undefined)
          done();
        }).catch((err)=>{
          expect().assertFail()
          done();
        })
      } catch (error) {
        expect().assertFail()
        done();
      }
      
    });

    /*
     * @tc.number  SUB_AA_ReisterErrorObserver_0200
     * @tc.name    Test unregisterErrorObserver with error number.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_ReisterErrorObserver_New_0200', 0, async function (done) {
      try {
        errorManager.off("error", -1).then((data)=>{
          expect().assertFail()
          done();
        }).catch((err)=>{
          expect(err.code).assertEqual(401)
          done();
        })
      } catch (error) {
        expect().assertFail()
        done();
      }
    });

    /*
     * @tc.number  SUB_AA_GetTopAbility_0100
     * @tc.name    Test getTopAbility.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_GetTopAbility_0100', 0, async function (done) {
      try {
        await abilityManager.getTopAbility().then((data)=>{
          expect(true).assertTrue();
          done();
        }).catch((err)=>{
          expect().assertFail()
          done();
        })
      } catch (error) {
        expect().assertFail()
        done();
      }
    });

    /*
     * @tc.number  SUB_AA_GetAbilityRunningInfo_0100
     * @tc.name    Test getAbilityRunningInfo.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_GetAbilityRunningInfo_0100', 0, async function (done) {
      try {
        await abilityManager.getAbilityRunningInfos().then((data)=>{
          expect(true).assertTrue();
          done();
        }).catch((err)=>{
          expect().assertFail()
          done();
        })
      } catch (error) {
        expect().assertFail()
        done();
      }
    });

    /*
     * @tc.number  SUB_AA_GetExtensionRunningInfos_0100
     * @tc.name    Test getExtensionRunningInfos.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_GetExtensionRunningInfos_0100', 0, async function (done) {
      try {
        let upperLimit = 1;
        await abilityManager.getExtensionRunningInfos(upperLimit).then((data)=>{
          expect(true).assertTrue();
          done();
        }).catch((err)=>{
          expect().assertFail()
          done();
        })
      } catch (error) {
        expect().assertFail()
        done();
      }
    });

    /*
     * @tc.number  SUB_AA_UpdateConfiguration_0100
     * @tc.name    Test updateConfiguration.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_UpdateConfiguration_0100', 0, async function (done) {
      try {
        // init for repeat test
        var configInit = {
          language: 'english'
        }
        await abilityManager.updateConfiguration(configInit, (err,data)=>{});

        var config = {
          language: 'chinese'
        }
        await abilityManager.updateConfiguration(config).then((data)=>{
          expect(true).assertTrue();
          done();
        }).catch((err)=>{
          expect().assertFail()
          done();
        })
      } catch (error) {
        expect().assertFail()
        done();
      }
    });
  })
}