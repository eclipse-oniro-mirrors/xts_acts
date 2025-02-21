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

import wantConstant from '@ohos.app.ability.wantConstant';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { getTempUriList, getPreUriList, createTempFile, createPreFile } from './utils'

let TEMP_COUNT = 500;
let PRE_COUNT = 500;

function sleep(time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}

export default function abilityTest() {

  describe('ActsBatchUriPermissionTest', function (done) {

    let tempUriList = [];
    let preUriList = [];

    beforeAll(async function (done){
      let TAG = 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_Test';
      await sleep(1000);
      console.info(TAG + ' beforeAll start');
      // init temp uri permission
      console.info(TAG + ' temp permission init start');;
      tempUriList = getTempUriList(globalThis.filesDir);
      let tempSuc = createTempFile(tempUriList.slice(0, TEMP_COUNT));
      console.info(TAG + ` suc = ${tempSuc}`);
      expect(tempSuc).assertTrue();
      console.info(TAG + ' temp permission init finished!');

      // init persistable uri permission
      console.info(TAG + ' pre permission init start');
      preUriList = getPreUriList();
      createPreFile(preUriList.slice(0, PRE_COUNT),(preSuc)=>{
        console.info(TAG + ` suc = ${preSuc}`);
        expect(preSuc).assertTrue();
        console.info(TAG + ' pre permission init finished!');
        done();
      })
    })

    beforeEach(async function(done){
      console.info('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_Test beforeEach');
      await sleep(1000);
      done();
    })

    // UIAbility - Temp read
    it('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0100',0, async function (done) {
      let abilityContext = globalThis.abilityContext;
      let TAG = 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0100';
      console.info('------------------------------ SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0100 Start ------------------------');
      let uriNum = TEMP_COUNT;
      let uriList = tempUriList.slice(1, uriNum);
      let uri = tempUriList[0];
      let want = {
        flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION,
        bundleName: 'com.example.batchuri_recv',
        abilityName: 'BatchUriPermissionAbility',
        uri: uri,
        parameters: {
          filesDir: globalThis.filesDir,
          'ability.params.stream': uriList,
          tempCount: TEMP_COUNT,
          testcase: 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0100'
        }
      };
      await abilityContext.startAbilityForResult(want).then((result) => {
        console.info(TAG + ` successCount = ${result.want.parameters.successCount}`);
        expect(result.want.parameters.successCount).assertEqual(`${TEMP_COUNT}`);
        console.info(TAG + ' success!');
        done();
      }).catch((error)=>{
        console.info(TAG + ' failed: ' + JSON.stringify(error));
        expect().assertFail();
      });
    })

    // UIAbility - Temp write
    it('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0200',0, async function (done) {
      let abilityContext = globalThis.abilityContext;
      let TAG = 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0200';
      console.info('------------------------------ SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0200 Start ------------------------');
      let uriNum = TEMP_COUNT;
      let uriList = tempUriList.slice(1, uriNum);
      let uri = tempUriList[0];
      let want = {
        flags: wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION,
        bundleName: 'com.example.batchuri_recv',
        abilityName: 'BatchUriPermissionAbility',
        uri: uri,
        parameters: {
          filesDir: globalThis.filesDir,
          'ability.params.stream': uriList,
          tempCount: TEMP_COUNT,
          testcase: 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0200'
        }
      };
      await abilityContext.startAbilityForResult(want).then((result) => {
        console.info(TAG + ` successCount = ${result.want.parameters.successCount}`);
        expect(result.want.parameters.successCount).assertEqual(`${TEMP_COUNT}`)
        console.info(TAG + ' success!');
        done();
      }).catch((error)=>{
        console.info(TAG + ' failed: ' + JSON.stringify(error));
        expect().assertFail()
      });
    })

    // UIAbility - Pre read
    it('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0300',0, async function (done) {
      let abilityContext = globalThis.abilityContext;
      let TAG = 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0300';
      console.info('------------------------------ SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0300 Start ------------------------');
      let uri = preUriList[0];
      let uriList = preUriList.slice(1, PRE_COUNT);
      let want = {
        flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION | wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION,
        bundleName: 'com.example.batchuri_recv',
        abilityName: 'BatchUriPermissionAbility',
        'uri': uri,
        parameters: {
          bundleName: 'com.example.batchuri_recv',
          'ability.params.stream': uriList,
          preCount: PRE_COUNT,
          testcase: 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0300'
        }
      };
      await abilityContext.startAbilityForResult(want).then((result) => {
        console.info(TAG + ` successCount = ${result.want.parameters.successCount}`);
        expect(result.want.parameters.successCount).assertEqual(`${PRE_COUNT}`);
        console.info(TAG + ' success!');
        done();
      }).catch((error) => {
        console.info(TAG + ' failed!' + JSON.stringify(error));
        expect().assertFail();
      })
    })

    // UIAbility - Pre Write
    it('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0400',0, async function (done) {
      let abilityContext = globalThis.abilityContext;
      let TAG = 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0400';
      console.info('------------------------------ SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0400 Start ------------------------');
      let uri = preUriList[0];
      let uriList = preUriList.slice(1, PRE_COUNT);
      let want = {
        flags: wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION | wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION,
        bundleName: 'com.example.batchuri_recv',
        abilityName: 'BatchUriPermissionAbility',
        'uri': uri,
        parameters: {
          bundleName: 'com.example.batchuri_recv',
          'ability.params.stream': uriList,
          preCount: PRE_COUNT,
          testcase: 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0400'
        }
      };
      await abilityContext.startAbilityForResult(want).then((result) => {
        console.info(TAG + ` successCount = ${result.want.parameters.successCount}`);
        expect(result.want.parameters.successCount).assertEqual(`${PRE_COUNT}`);
        console.info(TAG + ' success!');
        done();
      }).catch((error) => {
        console.info(TAG + ' failed!' + JSON.stringify(error));
        expect().assertFail();
      })
    })

    // UIAbility - Temp read 501
    it('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0500',0, async function (done) {
      let abilityContext = globalThis.abilityContext;
      let TAG = 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0500';
      console.info('------------------------------ SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0500 Start ------------------------');
      let uriNum = 501;
      let uriList = tempUriList.slice(1, uriNum);
      let uri = tempUriList[0];
      let want = {
        flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION,
        bundleName: 'com.example.batchuri_recv',
        abilityName: 'BatchUriPermissionAbility',
        uri: uri,
        parameters: {
          filesDir: globalThis.filesDir,
          'ability.params.stream': uriList,
          tempCount: uriNum,
          testcase: 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0500'
        }
      }
      await abilityContext.startAbilityForResult(want).then((result) => {
        console.info(TAG + ` successCount = ${result.want.parameters.successCount}`);
        expect(result.want.parameters.successCount).assertEqual(`${0}`);
        console.info(TAG + ' success!');
        done();
      }).catch((error)=>{
        console.info(TAG + ' failed: ' + JSON.stringify(error));
        expect().assertFail();
      });
    })

    // UIExtension - Temp read
    it('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0600',0, async function (done) {
      let TAG = 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0600';
      console.info('------------------------------ SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0600 Start ------------------------');
      let uriNum = TEMP_COUNT;
      globalThis.uriList = tempUriList.slice(1, uriNum);
      globalThis.fileUri = tempUriList[0];
      globalThis.flag = wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION;
      globalThis.testcase = 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0600';
      globalThis.tempCount = TEMP_COUNT;
      let want = {
        bundleName: 'com.example.batchuri',
        abilityName: 'EntryAbility',
      }
      console.log(TAG + ` want = ${JSON.stringify(want)}`);
      await globalThis.abilityContext.startAbilityForResult(want).then((result)=>{
        console.info(TAG + ` successCount = ${result.want.parameters.successCount}`);;
        expect(result.want.parameters.successCount).assertEqual(`${TEMP_COUNT}`);
        console.info(TAG + ' success!');
        done();
      }).catch((error) => {
        console.info(TAG + ' failed!' + JSON.stringify(error));
        expect().assertFail();
      });
    })

    // UIExtension - Temp write
    it('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0700',0, async function (done) {
      let TAG = 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0700';
      console.info('------------------------------ SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0700 Start ------------------------');
      let uriNum = TEMP_COUNT;
      globalThis.uriList = tempUriList.slice(1, uriNum);
      globalThis.fileUri = tempUriList[0];
      globalThis.flag = wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION;
      globalThis.testcase = 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0700';
      globalThis.tempCount = TEMP_COUNT;
      let want = {
        bundleName: 'com.example.batchuri',
        abilityName: 'EntryAbility',
      };
      console.log(TAG + ` want = ${JSON.stringify(want)}`);
      await globalThis.abilityContext.startAbilityForResult(want).then((result)=>{
        console.info(TAG + ` successCount = ${result.want.parameters.successCount}`);
        expect(result.want.parameters.successCount).assertEqual(`${TEMP_COUNT}`);
        console.info(TAG + ' success!');
        done();
      }).catch((error) => {
        console.info(TAG + ' failed!' + JSON.stringify(error));
        expect().assertFail();
      });
    })

    // UIExtension - Pre read
    it('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0800', 0, async function (done) {
      let TAG = 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0800';
      console.info('------------------------------ SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0800 Start ------------------------');
      globalThis.uriList = preUriList.slice(1, PRE_COUNT);
      globalThis.fileUri = preUriList[0];
      globalThis.flag = wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION | wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
      globalThis.testcase = 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0800';
      globalThis.preCount = PRE_COUNT;
      let want = {
        bundleName: 'com.example.batchuri',
        abilityName: 'EntryAbility',
      }
      await globalThis.abilityContext.startAbilityForResult(want).then((result) => {
        console.info(TAG + ` successCount = ${result.want.parameters.successCount}`);
        expect(result.want.parameters.successCount).assertEqual(`${PRE_COUNT}`);
        console.info(TAG + ' success!');
        done();
      }).catch((error) => {
        console.info(TAG + ' failed!' + JSON.stringify(error));
        expect().assertFail();
      });
    })

    // UIExtension - Pre write
    it('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0900', 0, async function (done) {
      let TAG = 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0900';
      console.info('------------------------------ SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0900 Start ------------------------');
      globalThis.uriList = preUriList.slice(1, PRE_COUNT);
      globalThis.fileUri = preUriList[0];
      globalThis.flag = wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION | wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
      globalThis.testcase = 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0900';
      globalThis.preCount = PRE_COUNT;
      let want = {
        bundleName: 'com.example.batchuri',
        abilityName: 'EntryAbility',
      };
      await globalThis.abilityContext.startAbilityForResult(want).then((result) => {
        console.info(TAG + ` successCount = ${result.want.parameters.successCount}`);
        expect(result.want.parameters.successCount).assertEqual(`${PRE_COUNT}`);
        console.info(TAG + ' success!');
        done();
      }).catch((error) => {
        console.info(TAG + ' failed!' + JSON.stringify(error));
        expect().assertFail();
      });
    })

    // UIExtension - Temp read 501
    it('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_1000',0, async function (done) {
      let TAG = 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_1000';
      console.info('------------------------------ SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_1000 Start ------------------------');
      let uriNum = 501;
      globalThis.uriList = tempUriList.slice(1, uriNum);
      globalThis.fileUri = tempUriList[0];
      globalThis.flag = wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION;
      globalThis.testcase = 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_1000';
      globalThis.tempCount = uriNum;
      let want = {
        bundleName: 'com.example.batchuri',
        abilityName: 'EntryAbility',
      };
      console.log(TAG + ` want = ${JSON.stringify(want)}`);
      await globalThis.abilityContext.startAbilityForResult(want).then((result)=>{
        console.info(TAG + ` successCount = ${result.want.parameters.successCount}`);
        expect(result.want.parameters.successCount).assertEqual(`${0}`);
        console.info(TAG + ' success!');
        done();
      }).catch((error) => {
        console.info(TAG + ' failed!' + JSON.stringify(error));
        expect().assertFail();
      });
    })
  })
}