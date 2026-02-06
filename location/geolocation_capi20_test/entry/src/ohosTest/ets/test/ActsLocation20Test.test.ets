/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import locationcapi20 from 'liblocationcapi20.so'
import { abilityAccessCtrl, bundle, common, Permissions, UIAbility } from '@kit.AbilityKit';
import { Driver, ON, Component } from '@kit.TestKit';
import { deviceInfo, BusinessError } from '@kit.BasicServicesKit';
import { geolocation, geoLocationManager } from '@kit.LocationKit';
import osaccount from '@ohos.account.osAccount'
import bundleManager from '@ohos.bundle.bundleManager';
import hilog from '@ohos.hilog';

const OS_LOCATION_ERR_OK = 0;
let deviceTypeInfo: string = deviceInfo.deviceType;
let locationEnabled = geoLocationManager.isLocationEnabled();
let bundleFlags =
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;

try {
  bundleManager.getBundleInfoForSelf(bundleFlags).then((data) => {
    hilog.info(0x0000, 'testTag', 'getBundleInfoForSelf successfully. Data: %{public}s', JSON.stringify(data));
  }).catch((err: BusinessError) => {
    hilog.error(0x0000, 'testTag', 'getBundleInfoForSelf failed. Cause: %{public}s', err.message);
  });
} catch (err) {
  let message = (err as BusinessError).message;
  hilog.error(0x0000, 'testTag', 'getBundleInfoForSelf failed: %{public}s', message);
}

export async function changedLocationMode() {
  await geolocation.isLocationEnabled().then(async (result) => {
    console.info('[lbs_js] getLocationSwitchState result: ' + JSON.stringify(result));
    if (!result) {
      await geoLocationManager.enableLocation().then(async (res) => {
        console.info('[lbs_js] test requestEnableLocation promise result: ' + JSON.stringify(res));
      }).catch((error: BusinessError) => {
        console.info("[lbs_js] promise then error." + JSON.stringify(error));
        expect().assertFail();
      });
    }
  });
  await geolocation.isLocationEnabled().then(async (result) => {
    console.info('[lbs_js] check LocationSwitchState result: ' + JSON.stringify(result));
  });
}

async function applyPermission() {
  let osAccountManager = osaccount.getAccountManager();
  console.info("=== getAccountManager finish");
  let localId = await osAccountManager.getOsAccountLocalIdFromProcess();
  console.info("LocalId is :" + localId);
  // let appInfo = await bundle.getApplicationInfo('com.location.napitest', 0, localId);
  let appInfo = await bundleManager.getBundleInfoForSelf(bundleFlags)
  console.info("LocalId is :" + localId);
  let atManager = abilityAccessCtrl.createAtManager();
  console.info("LocalId is :" + localId);
  if (atManager != null) {
    console.info('[permission] case accessTokenID is ')
    let tokenID = appInfo.appInfo.accessTokenId;
    console.info('appInfo:' + JSON.stringify(appInfo))
    console.info('[permission] case accessTokenID is ' + tokenID);
    let permissionName1: Permissions = 'ohos.permission.LOCATION';
    let permissionName2: Permissions = 'ohos.permission.APPROXIMATELY_LOCATION';
    let permissionName3: Permissions = 'ohos.permission.LOCATION_IN_BACKGROUND';
    await atManager.grantUserGrantedPermission(tokenID, permissionName1, 1).then((result) => {
      console.info('[permission] case grantUserGrantedPermission success :' + JSON.stringify(result));
    }).catch((err: BusinessError) => {
      console.info('[permission] case grantUserGrantedPermission failed :' + JSON.stringify(err));
    });
    await atManager.grantUserGrantedPermission(tokenID, permissionName2, 64).then((result) => {
      console.info('[permission] case grantUserGrantedPermission success :' + JSON.stringify(result));
    }).catch((err: BusinessError) => {
      console.info('[permission] case grantUserGrantedPermission failed :' + JSON.stringify(err));
    });
    await atManager.grantUserGrantedPermission(tokenID, permissionName3, 64).then((result) => {
      console.info('[permission] case grantUserGrantedPermission success :' + JSON.stringify(result));
    }).catch((err: BusinessError) => {
      console.info('[permission] case grantUserGrantedPermission failed :' + JSON.stringify(err));
    });
  } else {
    console.info('[permission] case apply permission failed, createAtManager failed');
  }
}

export default function ActsLocation20Test() {
  describe('ActsLocation20Test', () => {
    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      await applyPermission();
      await changedLocationMode();
      done();
    })
    afterAll(async (done: Function) => {
      geoLocationManager.disableLocation()
      done();
    }
    )

    /**
     * @tc.number  : SUB_LocationKit_OH_Location_StartLocating_Test_0102
     * @tc.name    : testLocationKitOH_Location_StartLocatingTest0102
     * @tc.desc    : test OH_Location_StartLocating1.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testLocationKitOH_Location_StartLocatingTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testLocationKitOH_Location_StartLocatingTest0102 start====");
          let result = locationcapi20.OH_Location_StartLocating3();
          console.info("====>testLocationKitOH_Location_StartLocatingTest0102 result: " + result);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testLocationKitOH_Location_StartLocatingTest0102 catch err: " + err);
          expect(false).assertEqual(OS_LOCATION_ERR_OK);
          done()
        }
      }
    )

    /**
     * @tc.number  : SUB_LocationKit_OH_Location_StopLocating_Test_0101
     * @tc.name    : testLocationKitOH_Location_StopLocatingTest0101
     * @tc.desc    : test OH_Location_StopLocating.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testLocationKitOH_Location_StopLocatingTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testLocationKitOH_Location_StopLocatingTest0101 start====");
          let result = locationcapi20.OH_Location_StopLocating3();
          console.info("====>testLocationKitOH_Location_StopLocatingTest0101 result: " + result);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testLocationKitOH_Location_StopLocatingTest0101 catch err: " + err);
          expect(false).assertEqual(OS_LOCATION_ERR_OK);
          done()
        }
      })
  })
}
