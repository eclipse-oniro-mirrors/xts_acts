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
import geolocationCApi from 'libgeolocationcapi.so';
import geolocationm from '@ohos.geoLocationManager';
import geolocation from '@ohos.geolocation';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { BusinessError } from '@kit.BasicServicesKit';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import osaccount from '@ohos.account.osAccount'

async function changedLocationMode(){
  await geolocation.isLocationEnabled().then(async(result) => {
    console.info('[lbs_js] getLocationSwitchState result: ' + JSON.stringify(result));
    if(!result){
      await geolocation.requestEnableLocation().then(async(result) => {
        console.info('[lbs_js] test requestEnableLocation promise result: ' + JSON.stringify(result));
      }).catch((error:BusinessError) => {
        console.info("[lbs_js] promise then error." + JSON.stringify(error));
        expect().assertFail();
      });
    }
  });
  await geolocation.isLocationEnabled().then(async(result) => {
    console.info('[lbs_js] check LocationSwitchState result: ' + JSON.stringify(result));
  });
}

async function applyPermission() {
  let osAccountManager = osaccount.getAccountManager();
  console.info("=== getAccountManager finish");
  let localId = await osAccountManager.getOsAccountLocalIdFromProcess();
  console.info("LocalId is :" + localId);
  let appInfo = await bundle.getApplicationInfo('com.location.napitest', 0, localId);
  let atManager = abilityAccessCtrl.createAtManager();
  if (atManager != null) {
    let tokenID = appInfo.accessTokenId;
    console.info('appInfo:' + JSON.stringify(appInfo))
    console.info('[permission] case accessTokenID is ' + tokenID);
    let permissionName1 : Permissions = 'ohos.permission.LOCATION';
    let permissionName2 : Permissions = 'ohos.permission.APPROXIMATELY_LOCATION';
    let permissionName3 : Permissions = 'ohos.permission.LOCATION_IN_BACKGROUND';
    await atManager.grantUserGrantedPermission(tokenID, permissionName1, 1).then((result) => {
      console.info('[permission] case grantUserGrantedPermission success :' + JSON.stringify(result));
    }).catch((err:BusinessError) => {
      console.info('[permission] case grantUserGrantedPermission failed :' + JSON.stringify(err));
    });
    await atManager.grantUserGrantedPermission(tokenID, permissionName2, 1).then((result) => {
      console.info('[permission] case grantUserGrantedPermission success :' + JSON.stringify(result));
    }).catch((err:BusinessError) => {
      console.info('[permission] case grantUserGrantedPermission failed :' + JSON.stringify(err));
    });
    await atManager.grantUserGrantedPermission(tokenID, permissionName3, 1).then((result) => {
      console.info('[permission] case grantUserGrantedPermission success :' + JSON.stringify(result));
    }).catch((err:BusinessError) => {
      console.info('[permission] case grantUserGrantedPermission failed :' + JSON.stringify(err));
    });
  } else {
    console.info('[permission] case apply permission failed, createAtManager failed');
  }
}

export default function geolocationCApiTest() {
  describe('GeolocationCApiTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      await applyPermission();
      done();
    })
    beforeEach(() => {
      console.info('beforeEach case');
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    /**
     * @tc.number     : SUB_HSS_LocationSystem_OH_LOCATION_IS_ENABLED_0001
     * @tc.name       : testOHLocationIsEnabled001
     * @tc.desc       : test OH_Location_Is_Enabled
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHLocationIsEnabled001', 0, async (done: Function) => {
      let capiResult: number = geolocationCApi.ohLocationIsEnabled();
      let api12Result: boolean = geolocationm.isLocationEnabled();
      expect(capiResult).assertEqual(api12Result);
      done();
    });

    /**
     * @tc.number     : SUB_HSS_LocationSystem_OH_LOCATION_START_LOCATING_0001
     * @tc.name       : testOHLocationStartLocatingAndStopLocating001
     * @tc.desc       : test OH_Location_Start_Locating
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHLocationStartLocatingAndStopLocating001', 0, async (done: Function) => {
      let result1: number = geolocationCApi.ohLocationStartLocating();
      expect(result1).assertEqual(0);
      let result2: number = geolocationCApi.ohLocationStopLocating();
      expect(result2).assertEqual(0);
      done();
    });
  })
}
