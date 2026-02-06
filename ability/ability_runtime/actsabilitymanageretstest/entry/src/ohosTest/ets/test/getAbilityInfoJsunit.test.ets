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

import Utils from './Utils';
import ability_featureAbility from '@ohos.ability.featureAbility';
import backgroundTaskManager from '@ohos.backgroundTaskManager';
import { describe, beforeAll, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';


function checkAbilityInfo(msg: string, data: ESObject) {
  console.log(msg + "checkAbilityInfo start  " + JSON.stringify(data));
  console.log(msg + "checkAbilityInfo bundleName : " + data.bundleName);
  console.log(msg + "checkAbilityInfo name : " + data.name);
  console.log(msg + "checkAbilityInfo label : " + data.label);
  console.log(msg + "checkAbilityInfo description : " + data.description);
  console.log(msg + "checkAbilityInfo icon : " + data.icon);
  console.log(msg + "checkAbilityInfo descriptionId : " + data.descriptionId);
  console.log(msg + "checkAbilityInfo iconId : " + data.iconId);
  console.log(msg + "checkAbilityInfo moduleName : " + data.moduleName);
  console.log(msg + "checkAbilityInfo process : " + data.process);
  console.log(msg + "checkAbilityInfo targetAbility : " + data.targetAbility);
  console.log(msg + "checkAbilityInfo backgroundModes : " + data.backgroundModes);
  console.log(msg + "checkAbilityInfo isVisible : " + data.isVisible);
  console.log(msg + "checkAbilityInfo formEnabled : " + data.formEnabled);
  console.log(msg + "checkAbilityInfo type : " + data.type)
  console.log(msg + "checkAbilityInfo orientation : " + data.orientation);
  console.log(msg + "checkAbilityInfo launchMode : " + data.launchMode);
  console.log(msg + "checkAbilityInfo permissions length : " + data.permissions.length);
  for (let j = 0; j < data.permissions.length; j++) {
    console.log(msg + "getAbilityInfo data.permissions[" + j + "] : " + data.permissions[j]);
  }
  console.log(msg + "checkAbilityInfo deviceTypes length : " + data.deviceTypes.length);
  for (let k = 0; k < data.deviceTypes.length; k++) {
    console.log(msg + "getAbilityInfo data.deviceTypes[" + k + "] : " + data.deviceTypes[k]);
  }
  console.log(msg + "checkAbilityInfo deviceCapabilities length : " + data.deviceCapabilities.length);
  for (let i = 0; i < data.deviceCapabilities.length; i++) {
    console.log(msg + "getAbilityInfo data.deviceCapabilities[" + i + "] : " + data.deviceCapabilities[i]);
  }
  console.log(msg + "checkAbilityInfo readPermission : " + data.readPermission);
  console.log(msg + "checkAbilityInfo writePermission : " + data.writePermission);
  console.log(msg + "checkAbilityInfo formEntity : " + data.formEntity);
  console.log(msg + "checkAbilityInfo minFormHeight : " + data.minFormHeight);
  console.log(msg + "checkAbilityInfo defaultFormHeight : " + data.defaultFormHeight);
  console.log(msg + "checkAbilityInfo minFormWidth : " + data.minFormWidth);
  console.log(msg + "checkAbilityInfo defaultFormWidth : " + data.defaultFormWidth);
  console.log(msg + "checkAbilityInfo uri : " + data.uri);
  console.log(msg + "checkAbilityInfo customizeData : " + data.customizeData);
  console.log(msg + "checkAbilityInfo labelId : " + data.labelId);
  console.log(msg + "checkAbilityInfo subType : " + data.subType);

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
  expect(data.name).assertEqual("com.ohos.acecollaboration.TestAbility");
  expect(data.label).assertEqual("$string:entry_MainAbility");
  expect(data.description).assertEqual("$string:mainability_description");
  expect(data.icon).assertEqual("$media:icon");
  expect(data.descriptionId > 0).assertTrue();
  expect(data.iconId > 0).assertTrue();
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
  checkApplicationInfo(msg, data.applicationInfo);
  expect(data.formEntity).assertEqual(0);
  expect(data.minFormHeight).assertEqual(0);
  expect(data.defaultFormHeight).assertEqual(0);
  expect(data.minFormWidth).assertEqual(0);
  expect(data.defaultFormWidth).assertEqual(0);
  expect(data.uri).assertEqual("");
  expect(data.labelId > 0).assertTrue();
  expect(data.subType).assertEqual(0);

  console.log(msg + "---checkAbilityInfo End---  ");
}


function checkApplicationInfo(msg: string, info: ESObject) {
  console.log(msg + "checkApplicationInfo start : " + JSON.stringify(info));
  console.log(msg + "checkApplicationInfo name : " + info.name);
  console.log(msg + "checkApplicationInfo description : " + info.description);
  console.log(msg + "checkApplicationInfo descriptionId : " + info.descriptionId);
  console.log(msg + "checkApplicationInfo systemApp : " + info.systemApp);
  console.log(msg + "checkApplicationInfo enabled : " + info.enabled);
  console.log(msg + "checkApplicationInfo label : " + info.label);
  console.log(msg + "checkApplicationInfo labelId : " + info.labelId);
  console.log(msg + "checkApplicationInfo icon : " + info.icon);
  console.log(msg + "checkApplicationInfo iconId : " + info.iconId);
  console.log(msg + "checkApplicationInfo process : " + info.process);
  console.log(msg + "checkApplicationInfo supportedModes : " + info.supportedModes);

  console.log(msg + "checkApplicationInfo moduleSourceDirs length : " + info.moduleSourceDirs.length);
  for (let j = 0; j < info.moduleSourceDirs.length; j++) {
    console.log(msg + "checkApplicationInfo info.moduleSourceDirs[" + j + "] : " + info.moduleSourceDirs[j]);
  }
  console.log(msg + "checkApplicationInfo permissions length : " + info.permissions.length);
  for (let k = 0; k < info.permissions.length; k++) {
    console.log(msg + "checkApplicationInfo info.permissions[" + k + "] : " + info.permissions[k]);
  }
  console.log(msg + "checkApplicationInfo moduleInfos length : " + info.moduleInfos.length);
  for (let i = 0; i < info.moduleInfos.length; i++) {
    console.log(msg + "checkApplicationInfo info.moduleInfos[" + i + "].moduleName : " + info.moduleInfos[i].moduleName);
    console.log(msg + "checkApplicationInfo info.moduleInfos[" + i + "].moduleSourceDir : " + info.moduleInfos[i].moduleSourceDir);
  }
  console.log(msg + "checkApplicationInfo entryDir : " + info.entryDir);

  expect(typeof (info)).assertEqual("object");
  expect(typeof (info.name)).assertEqual("string");
  expect(typeof (info.description)).assertEqual("string");
  expect(typeof (info.descriptionId)).assertEqual("number");
  expect(typeof (info.systemApp)).assertEqual("boolean");
  expect(typeof (info.enabled)).assertEqual("boolean");
  expect(typeof (info.label)).assertEqual("string");
  expect(typeof (info.labelId)).assertEqual("string");
  expect(typeof (info.icon)).assertEqual("string");
  expect(typeof (info.iconId)).assertEqual("string");
  expect(typeof (info.process)).assertEqual("string");
  expect(typeof (info.supportedModes)).assertEqual("number");
  expect(Array.isArray(info.permissions)).assertEqual(true);
  expect(Array.isArray(info.moduleInfos)).assertEqual(true);
  expect(info.name).assertEqual("com.ohos.acecollaboration");
  expect(info.description).assertEqual("");
  expect(info.descriptionId).assertEqual(0);
  expect(info.systemApp).assertEqual(true);
  expect(info.enabled).assertEqual(true);
  expect(info.label).assertEqual("$string:entry_MainAbility");
  expect(info.icon).assertEqual("$media:icon");
  expect(info.process).assertEqual("com.ohos.acecollaboration");
  expect(info.supportedModes).assertEqual(0);
  if (info.moduleSourceDirs.length == 1) {
    expect(info.moduleInfos[0].moduleName).assertEqual("entry");
  } else if (info.moduleSourceDirs.length == 2) {
    if (info.moduleInfos[0].moduleName == "myapplication1") {
      expect(info.moduleInfos[0].moduleName).assertEqual("myapplication1");
      expect(info.moduleInfos[1].moduleName).assertEqual("entry");
    } else {
      expect(info.moduleInfos[0].moduleName).assertEqual("myapplication2");
      expect(info.moduleInfos[1].moduleName).assertEqual("entry");
    }
  } else if (info.moduleSourceDirs.length == 3) {
    expect(info.moduleInfos[0].moduleName).assertEqual("myapplication1");
    expect(info.moduleInfos[1].moduleName).assertEqual("myapplication2");
    expect(info.moduleInfos[2].moduleName).assertEqual("entry");
  }
  console.log(msg + "---checkApplicationInfo End--- ");
}

export default function getHapModuleInfoJsunit() {
  describe('getAbilityInfoTest', () => {

    let TAG1 = "SUB_AA_OpenHarmony == getAbilityInfoTest: ";
    let sleepTimeOne = 1000;
    let id: number;
    beforeAll(async (done: Function) => {
      console.log(TAG1 + "beforeAll called");
      let myReason = 'test FaShowOnLockTest';
      let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
        console.log(TAG1 + "Request suspension delay will time out.");
      })
      id = delayInfo.requestId;
      console.log(TAG1 + "requestId is : " + id);
      setTimeout(() => {
        console.log(TAG1 + "beforeAll end");
        done();
      }, sleepTimeOne)
    })

    afterAll(async (done: Function) => {
      console.log(TAG1 + "afterAll called");
      backgroundTaskManager.cancelSuspendDelay(id);
      setTimeout(() => {
        console.log(TAG1 + "afterAll end");
        done();
      }, sleepTimeOne)
    })

    /**
     * @tc.number: context_getAbilityInfo_test_0100
     * @tc.name: getAbilityInfo:Query the current attributionability details.
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level 0
     */
    it('context_getAbilityInfo_test_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[context_getAbilityInfo_test_0100] START');
      await Utils.sleep(1000);
      let timeOldStamp = await Utils.getNowTime();
      let context = ability_featureAbility.getContext();
      await context.getAbilityInfo()
        .then((data) => {
          let timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('context_getAbilityInfo_test_0100', timeOldStamp, timeNewStamp);
          console.info('[context_getAbilityInfo_test_0100] data is:' + JSON.stringify(data));
          expect(typeof (data)).assertEqual("object");
        }).catch((error: BusinessError) => {
          console.error('[context_getAbilityInfo_test_0100] failed:' + JSON.stringify(error));
        })
      let promise = await context.getAbilityInfo();
      console.info('--[context_getAbilityInfo_test_0100] check---');
      checkAbilityInfo('context_getAbilityInfo_test_0100', promise);
      console.info('[context_getAbilityInfo_test_0100] FINISH');
      done();
    })

    /**
     * @tc.number: context_getAbilityInfo_test_0200
     * @tc.name: getAbilityInfo:Query the current attributionability details.
     * @tc.desc: Check the return value of the interface (by AsyncCallback)
     * @tc.level 0
     */
    it('context_getAbilityInfo_test_0200', Level.LEVEL0, async (done: Function) => {
      try {
        let context = ability_featureAbility.getContext();
        console.info('[context_getAbilityInfo_test_0200] START');
        await Utils.sleep(1000);
        let timeOldStamp = await Utils.getNowTime();
        context.getAbilityInfo((error, data) => {
          let timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('context_getAbilityInfo_test_0200', timeOldStamp, timeNewStamp);
          console.info('[context_getAbilityInfo_test_0200] data is:' + JSON.stringify(data));
          expect(typeof (data)).assertEqual("object");
        })
        let callback = await context.getAbilityInfo();
        console.info('---[context_getAbilityInfo_test_0200] check---');
        checkAbilityInfo('context_getAbilityInfo_test_0200', callback);
        console.info('[context_getAbilityInfo_test_0200] FINISH');
        done();
      } catch (error) {
        console.error('[context_getAbilityInfo_test_0200] failed: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.number: context_getAbilityInfo_test_0400
     * @tc.name: getAbilityInfo:Query the current attributionability details.
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level 0
     */
    it('context_getAbilityInfo_test_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[context_getAbilityInfo_test_0400] START');
      await Utils.sleep(1000);
      let timeOldStamp = await Utils.getNowTime();
      let context = ability_featureAbility.getContext();
      await context.getAbilityInfo()
        .then((data) => {
          let timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('context_getAbilityInfo_test_0400', timeOldStamp, timeNewStamp);
          console.info('[context_getAbilityInfo_test_0400] data is:' + JSON.stringify(data));
          expect(typeof (data)).assertEqual("object");
        }).catch((error: BusinessError) => {
          console.error('[context_getAbilityInfo_test_0400] failed:' + JSON.stringify(error));
        })
      let promise = await context.getAbilityInfo();
      console.info('--[context_getAbilityInfo_test_0400] check---');
      checkAbilityInfo('context_getAbilityInfo_test_0400', promise);
      console.info('[context_getAbilityInfo_test_0400] FINISH');
      done();
    })
  })
}
