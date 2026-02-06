/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import geolocation from '@ohos.geolocation';
import geolocations from '@system.geolocation';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import osaccount from '@ohos.account.osAccount'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function changedLocationMode(){
    await geolocation.isLocationEnabled().then(async(result) => {
        console.info('[lbs_js] getLocationSwitchState result: ' + JSON.stringify(result));
        if(!result){
            await geolocation.requestEnableLocation().then(async(result) => {
                await sleep(3000);
                console.info('[lbs_js] test requestEnableLocation promise result: ' + JSON.stringify(result));
            }).catch((error) => {
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
    let appInfo = await bundle.getApplicationInfo('ohos.acts.location.geolocation.function', 0, localId);
    let atManager = abilityAccessCtrl.createAtManager();
    if (atManager != null) {
        let tokenID = appInfo.accessTokenId;
        console.info('[permission] case accessTokenID is ' + tokenID);
        let permissionName1 = 'ohos.permission.LOCATION';
        let permissionName2 = 'ohos.permission.LOCATION_IN_BACKGROUND';
        await atManager.grantUserGrantedPermission(tokenID, permissionName1, 1).then((result) => {
            console.info('[permission] case grantUserGrantedPermission success :' + JSON.stringify(result));
        }).catch((err) => {
            console.info('[permission] case grantUserGrantedPermission failed :' + JSON.stringify(err));
        });
        await atManager.grantUserGrantedPermission(tokenID, permissionName2, 1).then((result) => {
            console.info('[permission] case grantUserGrantedPermission success :' + JSON.stringify(result));
        }).catch((err) => {
            console.info('[permission] case grantUserGrantedPermission failed :' + JSON.stringify(err));
        });
    } else {
        console.info('[permission] case apply permission failed, createAtManager failed');
    }
}
export default function geolocationTest_geo2() {

    describe('geolocationTest_geo2', function () {
        beforeAll(async function (done) {
            console.info('beforeAll case');
            await applyPermission();
            done();
        })
        beforeEach(async function (done) {
            console.info('beforeEach case');
            await changedLocationMode();
            done()
        })
        afterEach(function () {
        })


    /**
     * @tc.number SUB_HSS_LocationSystem_systemapi_0100
     * @tc.name Test getLocation
     * @tc.desc Obtains the geographical location of a device..
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
    */
     it('SUB_HSS_LocationSystem_systemapi_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        geolocations.getLocation({
            timeout:30000,
            coordType:'wgs84',
            success: function(geolocationResponse) {
                console.log('lbs_js [GetLocation-success], result' + JSON.stringify(geolocationResponse));
                expect(true).assertEqual(geolocationResponse.longitude != -1);
                expect(true).assertEqual(geolocationResponse.latitude != -1);
                expect(true).assertEqual(geolocationResponse.altitude != -1);
                expect(true).assertEqual(geolocationResponse.accuracy != -1);
                expect(true).assertEqual(geolocationResponse.time != -1);
            },
            fail: function(data, code) {
                switch(code){
                    case 601:
                        console.info("获取定位权限失败/失败原因/用户拒绝: "+ err);
                        break;
                    case 602:
                        console.info("权限未声明: "+ err);
                        break;
                    case 800:
                        console.info("超时失败原因/网络状况不佳或GPS不可用: "+ err);
                        break;
                    case 801:
                        console.info("系统位置开关未打开: "+ err);
                        break;
                    case 802:
                        console.info("该次调用结果未返回前接口又被重新调用/该次调用失败返回错误码: "+ err);
                        break;
                    default:
                        console.log('lbs_js [GetLocation-fail] data:' + data + ', code:' + code);
                }
            },
            complete: function() {
                console.log('lbs_js [GetLocation-complete]');
            }
        });
        done();
    })

    /**
     * @tc.number SUB_HSS_LocationSystem_systemapi_0200
     * @tc.name Test subscribe and unsubscribe
     * @tc.desc Test subscribe api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
    */
    it('SUB_HSS_LocationSystem_systemapi_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        geolocations.subscribe({
            coordType:'wgs84',
            success: function(data) {
                console.log('lbs_js [GetLocation-success], result' + JSON.stringify(data));
                expect(true).assertEqual(data !=null);
            },
            fail: function(data, code) {
                console.log('lbs_js [Subscribe-fail] code:' + code + ', data:' + data);
                expect().assertFail();
            },
        });
        geolocations.unsubscribe();
        console.info("[lbs_js] unsubscribe called")
        done();
    })

    /**
      * @tc.number SUB_HSS_LocationSystem_systemapi_0300
      * @tc.name test getLocationType
      * @tc.desc Subscribing to geographical location information .
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 2
      */
    it('SUB_HSS_LocationSystem_systemapi_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        geolocations.getLocationType({
            success: function(data) {
                console.log('success get location type:' + JSON.stringify(data));
                expect(true).assertEqual(data.types != null)
                expect(true).assertEqual(data.types.length != 0);
                if (data.types.length != 0) {
                    expect(true).assertEqual(data.types[0] == 'gps' || data.types[0] == 'network')
                }
                done()
            },
            fail: function(data, code) {
                console.log('fail to get location. code:' + code + ', data:' + JSON.stringify(data));
                expect().assertFail();
                done()
            },
            complete: function(result) {
                console.log('get location end' + JSON.stringify(result));
            },
        });
    })

    /**
      * @tc.number SUB_HSS_LocationSystem_systemapi_0400
      * @tc.name Test getSupportedCoordTypes
      * @tc.desc Obtains the geographical location of a device..
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 2
      */
    it('SUB_HSS_LocationSystem_systemapi_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        let types = geolocations.getSupportedCoordTypes();
        console.info('[lbs_js] getSupportedCoordTypes result: ' + JSON.stringify(types));
        expect(true).assertEqual(types.length !=0);

    })
    })
}





