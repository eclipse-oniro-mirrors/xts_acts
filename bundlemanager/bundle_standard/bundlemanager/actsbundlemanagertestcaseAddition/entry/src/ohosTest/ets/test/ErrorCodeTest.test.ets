
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impligetProfileByAbilityEmptyAbilityCalled.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { BusinessError ,zlib} from '@kit.BasicServicesKit';
import bundle from '@ohos.bundle';
import image from '@ohos.multimedia.image';
import bundleManager from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium";
import { defaultAppManager } from '@kit.AbilityKit';

import Utils from './Utils';
const BUNDLE_NAME = "ohos.acts.bundlemanagererrcode.test";
let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
const TAG = "ErrcodeTest"
let userId = 100;
let uid = 20010005;

let moduleName = 'entry';
let abilityName = 'EntryAbility';
let metadataName = 'ability_metadata';

export default function ErrcodeTest() {
  describe('ErrcodeTest', () =>  {


    /**
     * @tc.name   getProfileByAbilityCallBack401
     * @tc.number Sub_Bms_getProfileByAbility_401
     * @tc.desc   test errCode 401 when call getProfileByAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityCallBack401', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + "getProfileByAbilityCallBack401 start");
      try {
        bundleManager.getProfileByAbility(undefined, undefined, undefined, (err:BusinessError, data:Array<string>) => {
          if (err) {
            console.info(TAG + 'getProfileByAbilityCallBack401  failed: ' + err.message);
            expect().assertFail()
            done();
          } else {
            console.info(TAG + 'getBundleNameByUidCallBack401 successfully: ' + JSON.stringify(data));
            expect().assertFail();
            done();
          }
        });

      } catch (exception) {
        console.error(`Failed to getBundleNameByUid catch. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
        done();
      }

    });

    /**
     * @tc.name   getProfileByAbilityPromise401
     * @tc.number Sub_Bms_getProfileByAbility_401
     * @tc.desc   test errCode 401 when call  getProfileByAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByAbilityPromise401', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + "getProfileByAbilityPromise401 start");
      try {
       await bundleManager.getProfileByAbility(undefined, undefined,undefined).then((data) => {
          console.info(TAG + 'getProfileByAbilityPromise401 successfully: ' + JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(TAG + 'getProfileByAbilityPromise401 failed: ' + err.message);
         expect().assertFail();
         done();
        });

      } catch (exception) {
        console.error(`Failed to getProfileByAbilityPromise401 catch. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
        done();
      }

    });


    /**
     * @tc.name   getProfileByExtensionAbilityCallBack401
     * @tc.number Sub_Bms_getProfileByExtensionAbility_401
     * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityCallBack401', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + "getProfileByExtensionAbilityCallBack401 start");
      try {
        bundleManager.getProfileByExtensionAbility(undefined, undefined, undefined, (err:BusinessError, data:Array<string>) => {
          if (err) {
            console.info(TAG + 'getProfileByExtensionAbilityCallBack401 failed: ' + err.message);
            expect().assertFail();
            done();
          } else {
            console.info(TAG + 'getProfileByExtensionAbilityCallBack401 successfully: ' + JSON.stringify(data));
            expect().assertFail();
            done();
          }
        });

      } catch (exception) {
        console.error(`Failed to getProfileByExtensionAbilityCallBack401 catch. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   getProfileByExtensionAbilityPromise401
     * @tc.number Sub_Bms_getProfileByExtensionAbility_401
     * @tc.desc   test errCode 401 when call  getProfileByExtensionAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getProfileByExtensionAbilityPromise401', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + "getProfileByExtensionAbilityPromise401 start");
      try {
        await bundleManager.getProfileByExtensionAbility(undefined, undefined,undefined).then((data) => {
          console.info(TAG + 'getProfileByExtensionAbilityPromise401 successfully: ' + JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(TAG + 'getProfileByExtensionAbilityPromise401 failed: ' + err.message);
          expect().assertFail();
          done();
        });

      } catch (exception) {
        console.error(`Failed to getProfileByExtensionAbility401 catch. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
        done();
      }
    });




    /**
     * @tc.name   getSignatureInfo401
     * @tc.number Sub_Bms_getSignatureInfo_401
     * @tc.desc   test errCode 401 when call getSignatureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getSignatureInfo401', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + "getSignatureInfo401 start");
      try {
        let data = bundleManager.getSignatureInfo(undefined);
        console.info(TAG + 'getSignatureInfo401 getBundleInfo successfully: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG +'getSignatureInfo401 getBundleInfo catch failed: ' + message);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   getSignatureInfo17700021
     * @tc.number Sub_Bms_getSignatureInfo_17700021
     * @tc.desc   test errCode 17700021 when call getSignatureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getSignatureInfo17700021', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + "getSignatureInfo17700021 start");
      try {
        let data = bundleManager.getSignatureInfo(-20);
        console.info(TAG + 'getSignatureInfo17700021 getBundleInfo successfully: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG +'getSignatureInfo17700021 getBundleInfo catch failed: ' + message);
        expect(err.code).assertEqual(201);
        done();
      }
    });

   

    /**
     * @tc.name   isDefaultApplicationPromise401
     * @tc.number Sub_Bms_getAppCloneIdentity_401
     * @tc.desc   test errCode 401 when call isDefaultApplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('isDefaultApplicationPromise401', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + "isDefaultApplicationPromise401 start");
      try {
        await defaultAppManager.isDefaultApplication(undefined)
          .then((data) => {
            console.info(TAG + 'isDefaultApplicationPromise401  successfully: ' + JSON.stringify(data));
            expect().assertFail();
            done();
          }).catch((error: BusinessError) => {
          console.info(TAG + 'isDefaultApplicationPromise401 catch failed: ' + error);
            expect().assertFail();
            done();
        });

      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG + 'isDefaultApplicationPromise401  catch failed: ' + message);
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
        } else if (err.code === 401){
          expect(err.code).assertEqual(401);
        } else {
          expect().assertFail();
        }
        done();
      }
    });

    /**
     * @tc.name   isDefaultApplicationCallBack401
     * @tc.number Sub_Bms_getAppCloneIdentity_401
     * @tc.desc   test errCode 401 when call isDefaultApplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('isDefaultApplicationCallBack401', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + "isDefaultApplicationCallBack401 start");
      try {
        defaultAppManager.isDefaultApplication(undefined, (err: BusinessError, data) => {
          if (err) {
            console.info(TAG + 'isDefaultApplicationCallBack401 failed ' + JSON.stringify(data));
            expect().assertFail();
            done();
          } else {
            console.info(TAG + 'isDefaultApplicationCallBack401  successfully: ' + JSON.stringify(data));
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG + 'isDefaultApplicationCallBack401  catch failed: ' + message);
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
        } else if (err.code === 401){
          expect(err.code).assertEqual(401);
        } else {
          expect().assertFail();
        }
        done();
      }
    });

    /**
     * @tc.name   getLaunchWant17700072
     * @tc.number Sub_Bms_getLaunchWant_17700072
     * @tc.desc   test errCode 17700072 when call getLaunchWant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getLaunchWant17700072', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + "getLaunchWant17700072 start");
      try {
        let want = bundleManager.getLaunchWant();
        console.info(TAG + 'getLaunchWant17700072  successfully: ' + want.bundleName + ".." + want.abilityName);
        expect().assertFail();
        done();

      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG + 'getLaunchWant17700072  catch failed: ' + message);
        expect(err.code).assertEqual(17700072);
        done();
      }
    });

    /**
     * @tc.name   deflateEnd17800004
     * @tc.number Sub_Bms_deflateEnd_17800004
     * @tc.desc   test errCode 17800004 when call deflateEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('deflateEnd17800004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + "deflateEnd17800004 start");
      let arrayBufferOut = new ArrayBuffer(100);
      // do no init to get the Error code
      let zip = zlib.createZipSync();
      await zip.deflateEnd({ nextOut: arrayBufferOut }).then(data => {
        console.info('deflateEnd success')
        expect().assertFail();
        done();
      }).catch((errData: BusinessError) => {
        console.error(`errData is errCode:${errData.code}  message:${errData.message}`);
        expect(errData.code).assertEqual(17800004)
        done();
      })

    });

  })
}

