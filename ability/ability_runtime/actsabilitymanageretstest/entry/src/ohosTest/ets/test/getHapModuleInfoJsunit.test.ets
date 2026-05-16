/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import { describe, beforeAll, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from './Utils';
import ability_featureAbility from '@ohos.ability.featureAbility';
import backgroundTaskManager from '@ohos.backgroundTaskManager';
import { BusinessError } from '@ohos.base';

function checkHapModuleInfo(msg: string, data: ESObject) {
  console.log(msg + "checkHapModuleInfo start  " + JSON.stringify(data));
  console.log(msg + "checkHapModuleInfo name : " + data.name);
  console.log(msg + "checkHapModuleInfo description : " + data.description);
  console.log(msg + "checkHapModuleInfo descriptionId : " + data.descriptionId);
  console.log(msg + "checkHapModuleInfo icon : " + data.icon);
  console.log(msg + "checkHapModuleInfo label : " + data.label);
  console.log(msg + "checkHapModuleInfo labelId : " + data.labelId);
  console.log(msg + "checkHapModuleInfo iconId : " + data.iconId);
  console.log(msg + "checkHapModuleInfo backgroundImg : " + data.backgroundImg);
  console.log(msg + "checkHapModuleInfo supportedModes : " + data.supportedModes);
  console.log(msg + "checkHapModuleInfo  reqCapabilities length : " + data.reqCapabilities.length);
  for (let j = 0; j < data.reqCapabilities.length; j++) {
    console.log(msg + "getHapModuleInfo data.reqCapabilities[" + j + "] : " + data.reqCapabilities[j]);
  }
  console.log(msg + "checkHapModuleInfo  deviceTypes length : " + data.deviceTypes.length);
  for (let k = 0; k < data.deviceTypes.length; k++) {
    console.log(msg + "getHapModuleInfo data.deviceTypes[" + k + "] : " + data.deviceTypes[k]);
  }
  console.log(msg + "checkHapModuleInfo abilityInfo length : " + data.abilityInfo.length);
  console.log(msg + "checkHapModuleInfo moduleName : " + data.moduleName);
  console.log(msg + "checkHapModuleInfo mainAbilityName : " + data.mainAbilityName);
  console.log(msg + "checkHapModuleInfo installationFree : " + data.installationFree);
  expect(typeof (data)).assertEqual("object");
  expect(typeof (data.name)).assertEqual("string");
  expect(typeof (data.description)).assertEqual("string");
  expect(typeof (data.descriptionId)).assertEqual("number");
  expect(typeof (data.icon)).assertEqual("string");
  expect(typeof (data.label)).assertEqual("string");
  expect(typeof (data.labelId)).assertEqual("number");
  expect(typeof (data.iconId)).assertEqual("number");
  expect(typeof (data.backgroundImg)).assertEqual("string");
  expect(typeof (data.supportedModes)).assertEqual("number");
  expect(Array.isArray(data.reqCapabilities)).assertEqual(true);
  expect(Array.isArray(data.deviceTypes)).assertEqual(true);
  expect(Array.isArray(data.abilityInfo)).assertEqual(true);
  expect(typeof (data.moduleName)).assertEqual("string");
  expect(typeof (data.mainAbilityName)).assertEqual("string");
  expect(typeof (data.installationFree)).assertEqual("boolean");
  expect(data.name).assertEqual("com.ohos.acecollaboration.MyApplication");
  expect(data.description).assertEqual("");
  expect(data.descriptionId).assertEqual(0);
  expect(data.icon).assertEqual("$media:icon");
  expect(data.label).assertEqual("$string:entry_MainAbility");
  expect(data.labelId).assertEqual(16777224);
  expect(data.iconId).assertEqual(16777227);
  expect(data.backgroundImg).assertEqual("");
  expect(data.supportedModes).assertEqual(0);
  expect(data.deviceTypes.length).assertEqual(0);
  console.info(msg + ' data.abilityInfo.length ' + data.abilityInfo.length)
  checkAbilityInfo(msg, data.abilityInfo[0]);
  expect(data.moduleName).assertEqual("entry")
  expect(data.mainAbilityName).assertEqual("com.ohos.acecollaboration.TestAbility");
  expect(data.installationFree).assertEqual(false);
  console.log(msg + "---checkHapModuleInfo End---");
}

function checkAbilityInfo(msg: string,data: ESObject) {
  console.log(msg+ "checkAbilityInfo start  " + JSON.stringify(data));
  console.log(msg+ "checkAbilityInfo bundleName : " + data.bundleName);
  console.log(msg+ "checkAbilityInfo name : " + data.name);
  console.log(msg+ "checkAbilityInfo label : " + data.label);
  console.log(msg+ "checkAbilityInfo description : " + data.description);
  console.log(msg+ "checkAbilityInfo icon : " + data.icon);
  console.log(msg+ "checkAbilityInfo descriptionId : " + data.descriptionId);
  console.log(msg+ "checkAbilityInfo iconId : " + data.iconId);
  console.log(msg+ "checkAbilityInfo moduleName : " + data.moduleName);
  console.log(msg+ "checkAbilityInfo process : " + data.process);
  console.log(msg+ "checkAbilityInfo targetAbility : " + data.targetAbility);
  console.log(msg+ "checkAbilityInfo backgroundModes : " + data.backgroundModes);
  console.log(msg+ "checkAbilityInfo isVisible : " + data.isVisible);
  console.log(msg+ "checkAbilityInfo formEnabled : " + data.formEnabled);
  console.log(msg+ "checkAbilityInfo type : " + data.type)
  console.log(msg+ "checkAbilityInfo orientation : " + data.orientation);
  console.log(msg+ "checkAbilityInfo launchMode : " + data.launchMode);
  console.log(msg+ "checkAbilityInfo permissions length : " + data.permissions.length);
  for (let j = 0; j < data.permissions.length; j++) {
    console.log(msg+ "getAbilityInfo data.permissions[" + j + "] : " + data.permissions[j]);
  }
  console.log(msg+ "checkAbilityInfo deviceTypes length : " + data.deviceTypes.length);
  for (let k = 0; k < data.deviceTypes.length; k++) {
    console.log(msg+ "getAbilityInfo data.deviceTypes[" + k + "] : " + data.deviceTypes[k]);
  }
  console.log(msg+ "checkAbilityInfo deviceCapabilities length : " + data.deviceCapabilities.length);
  for (let i = 0; i < data.deviceCapabilities.length; i++) {
    console.log(msg+ "getAbilityInfo data.deviceCapabilities[" + i + "] : " + data.deviceCapabilities[i]);
  }
  console.log(msg+ "checkAbilityInfo readPermission : " + data.readPermission);
  console.log(msg+ "checkAbilityInfo writePermission : " + data.writePermission);
  console.log(msg+ "checkAbilityInfo formEntity : " + data.formEntity);
  console.log(msg+ "checkAbilityInfo minFormHeight : " + data.minFormHeight);
  console.log(msg+ "checkAbilityInfo defaultFormHeight : " + data.defaultFormHeight);
  console.log(msg+ "checkAbilityInfo minFormWidth : " + data.minFormWidth);
  console.log(msg+ "checkAbilityInfo defaultFormWidth : " + data.defaultFormWidth);
  console.log(msg+ "checkAbilityInfo uri : " + data.uri);
  console.log(msg+ "checkAbilityInfo labelId : " + data.labelId);
  console.log(msg+ "checkAbilityInfo subType : " + data.subType);
  expect(typeof (data)).assertEqual("object");
  expect(typeof (data.bundleName)).assertEqual("string");
  expect(typeof (data.name)).assertEqual("string");
  expect(typeof (data.label)).assertEqual("string");
  expect(typeof (data.description)).assertEqual("string");
  expect(typeof (data.icon)).assertEqual("string");
  expect(typeof (data.labelId)).assertEqual("number");
  expect(typeof (data.descriptionId)).assertEqual("number");
  expect(typeof (data.iconId)).assertEqual("number");
  expect(typeof (data.moduleName)).assertEqual("string");
  expect(typeof (data.process)).assertEqual("string");
  expect(typeof (data.targetAbility)).assertEqual("string");
  expect(typeof (data.backgroundModes)).assertEqual("number");
  expect(typeof (data.isVisible)).assertEqual("boolean");
  expect(typeof (data.formEnabled)).assertEqual("boolean");
  expect(typeof (data.type)).assertEqual("number");
  expect(typeof (data.subType)).assertEqual("number");
  expect(typeof (data.orientation)).assertEqual("number");
  expect(typeof (data.launchMode)).assertEqual("number");
  expect(Array.isArray(data.permissions)).assertEqual(true);
  expect(Array.isArray(data.deviceTypes)).assertEqual(true);
  expect(Array.isArray(data.deviceCapabilities)).assertEqual(true);
  expect(typeof (data.readPermission)).assertEqual("string");
  expect(typeof (data.writePermission)).assertEqual("string");
  expect(typeof (data.applicationInfo)).assertEqual("object");
  expect(typeof (data.formEntity)).assertEqual("number");
  expect(typeof (data.minFormHeight)).assertEqual("number");
  expect(typeof (data.defaultFormHeight)).assertEqual("number");
  expect(typeof (data.minFormWidth)).assertEqual("number");
  expect(typeof (data.defaultFormWidth)).assertEqual("number");
  expect(typeof (data.uri)).assertEqual("string");
  expect(data.bundleName).assertEqual("com.ohos.acecollaboration");
  expect(data.name).assertEqual("com.ohos.acecollaboration.MainAbility");
  expect(data.label).assertEqual("$string:entry_MainAbility");
  expect(data.description).assertEqual("$string:mainability_description");
  expect(data.icon).assertEqual("$media:icon");
  expect(data.moduleName).assertEqual("entry");
  expect(data.process).assertEqual("com.ohos.acecollaboration");
  expect(data.targetAbility).assertEqual("");
  expect(data.backgroundModes).assertEqual(0);
  expect(data.isVisible).assertEqual(true);
  expect(data.formEnabled).assertEqual(false);
  expect(data.type).assertEqual(1);
  expect(data.orientation).assertEqual(0);
  expect(data.launchMode).assertEqual(1);
  expect(data.deviceTypes.length).assertEqual(0);
  expect(data.readPermission).assertEqual("");
  expect(data.writePermission).assertEqual("");
  expect(data.formEntity).assertEqual(0);
  expect(data.minFormHeight).assertEqual(0);
  expect(data.defaultFormHeight).assertEqual(0);
  expect(data.minFormWidth).assertEqual(0);
  expect(data.defaultFormWidth).assertEqual(0);
  expect(data.uri).assertEqual("");
  expect(data.subType).assertEqual(0);
  console.log(msg+ "---checkAbilityInfo End---  ");
}
export default function getHapModuleInfoJsunit() {
  describe('getHapModuleInfoTest', () => {

    let TAG1 = "SUB_AA_OpenHarmony == getHapModuleInfoTest: ";
    let id: number;
      beforeAll(async (done: Function) => {
        console.log(TAG1 + "beforeAll called");
        let myReason = 'test FaShowOnLockTest';
        let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
            console.log(TAG1 + "Request suspension delay will time out.");
        })
        id = delayInfo.requestId;
        console.log(TAG1 + "requestId is : " + id);
        console.log(TAG1 + "beforeAll end");
            done();
    })

    afterAll(async (done: Function) => {
        console.log(TAG1 + "afterAll called");
        backgroundTaskManager.cancelSuspendDelay(id);
        console.log(TAG1 + "afterAll end");
            done();
    })

    /**
     * @tc.name   context_getHapModuleInfo_test_0100
     * @tc.number context_getHapModuleInfo_test_0100
     * @tc.desc   Check the return type of the interface (by Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('context_getHapModuleInfo_test_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[context_getHapModuleInfo_test_0100] START');
      let timeOldStamp = await Utils.getNowTime();
      let context = ability_featureAbility.getContext();
      context.getHapModuleInfo()
        .then((data) => {
          let timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('context_getHapModuleInfo_test_0100', timeOldStamp, timeNewStamp);
          console.info('[context_getHapModuleInfo_test_0100] data is:' + JSON.stringify(data));
          expect(typeof (data)).assertEqual("object");
        })
        .catch((error: BusinessError) => {
          console.error('[context_getHapModuleInfo_test_0100] failed:' + JSON.stringify(error));
        })
      let promise = await context.getHapModuleInfo();
      console.info('---[context_getHapModuleInfo_test_0100] check---');
      checkHapModuleInfo('context_getHapModuleInfo_test_0100', promise);
      console.info('[context_getHapModuleInfo_test_0100] FINISH');
      done();
    })

    /**
     * @tc.name   context_getHapModuleInfo_test_0200
     * @tc.number context_getHapModuleInfo_test_0200
     * @tc.desc   Check the return type of the interface (by Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('context_getHapModuleInfo_test_0200', Level.LEVEL0, async (done: Function) => {
      let callback: ESObject;
      try {
        console.info('[context_getHapModuleInfo_test_0200] START');
        let timeOldStamp = await Utils.getNowTime();
        let context = ability_featureAbility.getContext();
        context.getHapModuleInfo((error, data) => {
          let timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('context_getHapModuleInfo_test_0200', timeOldStamp, timeNewStamp);
          console.info('[context_getHapModuleInfo_test_0200] data is:' + JSON.stringify(data));
          callback = data;
          expect(typeof (data)).assertEqual("object");
        })
      } catch (error) {
        console.error('[context_getHapModuleInfo_test_0200] failed: ' + JSON.stringify(error));
      }
      await Utils.sleep(1000);
      console.info('---[context_getHapModuleInfo_test_0200] check---');
      checkHapModuleInfo('context_getHapModuleInfo_test_0200', callback);
      console.info('[context_getHapModuleInfo_test_0200] FINISH');
      done();
    })
  })
}

