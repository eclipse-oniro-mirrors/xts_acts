
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

    /*
     * @tc.number: Sub_Bms_GetBundleInfoNoUserId_401
     * @tc.name:  getBundleInfoTestNoUserId401
     * @tc.desc: test errCode 401 when call getBundleInfo
     */
    it('getBundleInfoTestNoUserId401', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info("getBundleInfoTestNoUserId401 start");
      try {
        bundleManager.getBundleInfo(undefined, bundleFlags, (err, data) => {
          if (err) {
            console.info(TAG + 'getBundleInfoTestNoUserId401 getBundleInfo failed: ' + err.message);
            expect().assertFail();
            done();
          } else {
            console.info(TAG + 'getBundleInfoTestNoUserId401 getBundleInfo successfully: ' + JSON.stringify(data));
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG + 'getBundleInfoTestNoUserId401 getBundleInfo catch failed: ' + message);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number: Sub_Bms_GetBundleInfoNoUserId_17700001
     * @tc.name:  getBundleInfoTestNoUserId17700001
     * @tc.desc: test errCode 17700001 when call getBundleInfo
     */
    it('getBundleInfoTestNoUserId17700001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
      console.info("getBundleInfoTestNoUserId17700001 start");
      try {
        bundleManager.getBundleInfo("xx", bundleFlags, (err, data) => {
          if (err) {
            console.info(TAG + 'getBundleInfoTestNoUserId17700001 getBundleInfo failed: ' + err.message);
            expect(err.code).assertEqual(17700001);
            done();
          } else {
            console.info(TAG + 'getBundleInfoTestNoUserId17700001 getBundleInfo successfully: ' + JSON.stringify(data));
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG + 'getBundleInfoTestNoUserId17700001 getBundleInfo catch failed: ' + message);
        expect().assertFail();
        done();
      }
    });


    /*
     * @tc.number: Sub_Bms_GetBundleInfoWithUserId_401
     * @tc.name:  getBundleInfoTestWithUserIdCallBack401
     * @tc.desc: test errCode 401 when call getBundleInfo
     */
    it('getBundleInfoTestWithUserIdCallBack401', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info("getBundleInfoTestWithUserIdCallBack401 start");
      try {
        bundleManager.getBundleInfo(undefined, bundleFlags, userId, (err, data) => {
          if (err) {
            console.info(TAG + 'getBundleInfoTestWithUserIdCallBack401 getBundleInfo failed: ' + err.message);
            expect().assertFail();
            done();
          } else {
            console.info(TAG + 'getBundleInfoTestWithUserIdCallBack401 getBundleInfo successfully: ' + JSON.stringify(data));
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG + 'getBundleInfoTestWithUserIdCallBack401 getBundleInfo catch failed: ' + message);
        expect(err.code).assertEqual(401);
        done();
      }

    });

    /*
     * @tc.number: Sub_Bms_GetBundleInfoWithUserId_17700001
     * @tc.name:  getBundleInfoTestWithUserIdCallBack17700001
     * @tc.desc: test errCode 17700001 when call getBundleInfo
     */
    it('getBundleInfoTestWithUserIdCallBack177001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG +"getBundleInfoTestWithUserIdCallBack177001 start");
      try {
        bundleManager.getBundleInfo("xx", bundleFlags, userId, (err, data) => {
          if (err) {
            console.info('getBundleInfoTestWithUserIdCallBack177001 getBundleInfo failed: ' + err.message);
            expect(err.code).assertEqual(17700001);
            done();
          } else {
            console.info(TAG +'getBundleInfoTestWithUserIdCallBack177001 getBundleInfo successfully: ' + JSON.stringify(data));
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG +'getBundleInfoTestWithUserIdCallBack177001 getBundleInfo catch failed: ' + message);
        expect().assertFail();
        done();
      }

    });

    /*
    * @tc.number: Sub_Bms_GetBundleInfoWithUserId_17700004
    * @tc.name:  getBundleInfoTestWithUserIdCallBack17700004
    * @tc.desc: test errCode 17700004 when call getBundleInfo
    */
    it('getBundleInfoTestWithUserIdCallBack177004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + "getBundleInfoTestWithUserIdCallBack177004 start");
      try {
        bundleManager.getBundleInfo(BUNDLE_NAME, bundleFlags, 200000, (err, data) => {
          if (err) {
            console.info(TAG + 'getBundleInfoTestWithUserIdCallBack177004 getBundleInfo failed: ' + err.message);
            expect(err.code).assertEqual(17700004);
            done();
          } else {
            console.info(TAG +'getBundleInfoTestWithUserIdCallBack177004 getBundleInfo successfully: ' + JSON.stringify(data));
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG +'getBundleInfoTestWithUserIdCallBack177004 getBundleInfo catch failed: ' + message);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: Sub_Bms_GetBundleInfoWithUserId_401
     * @tc.name:  getBundleInfoTestWithUserIdPromise401
     * @tc.desc: test errCode 401 when call getBundleInfo
    */
    it('getBundleInfoTestWithUserIdPromise401', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info("getBundleInfoTestWithUserIdPromise401 start");
      try {
        await bundleManager.getBundleInfo(undefined, bundleFlags, userId).then((data) => {
          console.info('getBundleInfoTestWithUserIdPromise401 getBundleInfo successfully: ' + JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info('getBundleInfoTestWithUserIdPromise401  getBundleInfo failed: ' + err.message);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let message = (err as BusinessError).message;
        console.info('getBundleInfoTestWithUserIdPromise401 getBundleInfo catch failed: ' + message);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number: Sub_Bms_GetBundleInfoWithUserId_17700001
     * @tc.name:  getBundleInfoTestWithUserIdPromise17700001
     * @tc.desc: test errCode 17700001 when call getBundleInfo
    */
    it('getBundleInfoTestWithUserIdPromise17700001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
      console.info(TAG + "getBundleInfoTestWithUserIdPromise17700001 start");
      try {
        await bundleManager.getBundleInfo("xx", bundleFlags, userId).then((data) => {
          console.info(TAG +'getBundleInfoTestWithUserIdPromise17700001  getBundleInfo successfully: ' + JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(TAG +'getBundleInfoTestWithUserIdPromise17700001 getBundleInfo failed: ' + err.message);
          expect(err.code).assertEqual(17700001);
          done();
        });
      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG +'getBundleInfoTestWithUserIdPromise17700001 getBundleInfo catch failed: ' + message);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: Sub_Bms_GetBundleInfoWithUserId_17700004
    * @tc.name:  getBundleInfoTestWithUserIdPromise17700004
    * @tc.desc: test errCode 17700004 when call getBundleInfo
    */
    it('getBundleInfoTestWithUserIdPromise17700004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) =>  {
      console.info(TAG +"getBundleInfoTestWithUserIdPromise17700004 start");
      try {
       await bundleManager.getBundleInfo(BUNDLE_NAME, bundleFlags, 2000000).then((data) => {
          console.info(TAG + 'getBundleInfoTestWithUserIdPromise17700004  getBundleInfo successfully: ' + JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(TAG + 'getBundleInfoTestWithUserIdPromise17700004 getBundleInfo failed: ' + err.message);
          expect(err.code).assertEqual(17700004);
          done();
        });
      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG + 'getBundleInfoTestWithUserIdPromise17700004 getBundleInfo catch failed: ' + message);
        expect().assertFail();
        done();
      }

    });

    /*
     * @tc.number: Sub_Bms_getBundleNameByUid_401
     * @tc.name:  getBundleNameByUidCallBack401
     * @tc.desc: test errCode 401 when call getBundleNameByUid
     */
    it('getBundleNameByUidCallBack401', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG +"getBundleNameByUidCallBack401 start");
      try {
        bundleManager.getBundleNameByUid(undefined, (err:BusinessError,data:String) => {
          if (err) {
            console.info(TAG + 'getBundleNameByUidCallBack401  failed: ' + err.message);
            expect().assertFail();
            done();
          } else {
            console.info(TAG + 'getBundleNameByUidCallBack401 successfully: ' + JSON.stringify(data));
            expect().assertFail();
            done();
          }
        })
      } catch (exception) {
        console.error(`Failed to getBundleNameByUid catch. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
        done();
      }
    });

    /*
   * @tc.number: Sub_Bms_getBundleNameByUid_17700021
   * @tc.name:  getBundleNameByUidCallBack17700021
   * @tc.desc: test errCode 17700021 when call getBundleNameByUid
   */
    it('getBundleNameByUidCallBack17700021', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) =>  {
      console.info(TAG +"getBundleNameByUidCallBack17700021 start");
      try {
        bundleManager.getBundleNameByUid(2190, (err:BusinessError,data:String) => {
          if (err) {
            console.info(TAG + 'getBundleNameByUidCallBack401  failed: ' + err.message);
            expect(err.code).assertEqual(17700021);
            done();
          } else {
            console.info(TAG + 'getBundleNameByUidCallBack401 successfully: ' + JSON.stringify(data));
            expect().assertFail();
            done();
          }
        })
      } catch (exception) {
        console.error(`Failed to getBundleNameByUidCallBack17700021 catch. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }

    });

    /*
    * @tc.number: Sub_Bms_getBundleNameByUid_401
    * @tc.name:  getBundleNameByUidPromise401
    * @tc.desc: test errCode 401 when call getBundleNameByUid
    */
    it('getBundleNameByUidPromise401', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG +"getBundleNameByUidPromise401 start");
      try {
        await bundleManager.getBundleNameByUid(undefined).then(data => {
          console.info(TAG + 'getBundleNameByUidPromise401 successfully: ' + JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((err:BusinessError)=> {
          console.info(TAG + 'getBundleNameByUidPromise401  failed: ' + err.message);
          expect().assertFail();
          done();
        })
      } catch (exception) {
        console.error(`Failed to getBundleNameByUidPromise401 catch. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
        done();
      }

    });

    /*
     * @tc.number: Sub_Bms_getBundleNameByUid_17700021
     * @tc.name:  getBundleNameByUidPromise17700021
    * @tc.desc: test errCode 17700021 when call getBundleNameByUid
    */
    it('getBundleNameByUidPromise17700021', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + "getBundleNameByUidPromise17700021 start");
      try {
        bundleManager.getBundleNameByUid(2190).then(data => {
          console.info(TAG + 'getBundleNameByUidPromise17700021 successfully: ' + JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((err:BusinessError)=> {
          console.info(TAG + 'getBundleNameByUidPromise17700021 failed: ' + err.message);
          expect(err.code).assertEqual(17700021);
          done();
        })
      } catch (exception) {
        console.error(`Failed to getBundleNameByUidPromise17700021 catch. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }

    });

    /*
    * @tc.number: Sub_Bms_getBundleNameByUid_401
    * @tc.name:  getBundleNameByUidSync401
    * @tc.desc: test errCode 401 when call getBundleNameByUidSync
    */
    it('getBundleNameByUidSync401', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG +"getBundleNameByUidSync401 start");
      try {
        let data = bundleManager.getBundleNameByUidSync(undefined);
        console.info(TAG + 'getBundleNameByUidSync401 successfully: ' + JSON.stringify(data));
        console.info(TAG + 'getBundleNameByUidSync401 successfully: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(`Failed to getBundleNameByUidSync401 catch. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
        done();
      }
    });

    /*
   * @tc.number: Sub_Bms_getBundleNameByUid_17700021
   * @tc.name:  getBundleNameByUidSync17700021
   * @tc.desc: test errCode 401 when call getBundleNameByUidSync
   */
    it('getBundleNameByUidSync17700021', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG +"getBundleNameByUidSync17700021 start");
      try {
        let data = bundleManager.getBundleNameByUidSync(2190);
        console.info(TAG + 'getBundleNameByUidSync17700021 successfully: ' + JSON.stringify(data));
        console.info(TAG + 'getBundleNameByUidSync17700021 successfully: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(`Failed to getBundleNameByUidSync17700021 catch. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(17700021);
        done();
      }

    });

   
  


    /*
    * @tc.number: Sub_Bms_getBundleInfoSyncWithUserId_401
    * @tc.name:  getBundleInfoSynWithUserId401
    * @tc.desc: test errCode 401 when call getBundleInfoSync
    */
    it('getBundleInfoSynWithUserId401', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + " getBundleInfoSynWithUserId401 start");
      try {
        let data = bundleManager.getBundleInfoSync(undefined,bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION, userId);
        console.info(TAG + 'getBundleInfoSynWithUserId401 getBundleInfo successfully: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG +'getBundleInfoSynWithUserId401 getBundleInfo catch failed: ' + message);
        expect(err.code).assertEqual(401);
        done();
      }

    });

    /*
    * @tc.number: Sub_Bms_getBundleInfoSyncWithUserId_17700001
    * @tc.name:  getBundleInfoSynWithUserId17700001
    * @tc.desc: test errCode 17700001 when call getBundleInfoSync
    */
    it('getBundleInfoSynWithUserId17700001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + " getBundleInfoSynWithUserId17700001 start");
      try {
        let data = bundleManager.getBundleInfoSync("xxxx", bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION, userId);
        console.info(TAG + 'getBundleInfoSynWithUserId17700001 getBundleInfo successfully: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG +'getBundleInfoSynWithUserId17700001 getBundleInfo catch failed: ' + message);
        expect(err.code).assertEqual(17700001);
        done();
      }
    });

    /*
    * @tc.number: Sub_Bms_getBundleInfoSyncWithUserId_17700004
    * @tc.name:  getBundleInfoSynWithUserId17700004
    * @tc.desc: test errCode 17700004 when call getBundleInfoSync
    */
    it('getBundleInfoSynWithUserId17700004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + " getBundleInfoSynWithUserId17700004 start");
      try {
        let data = bundleManager.getBundleInfoSync(BUNDLE_NAME, bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION, 20);
        console.info(TAG + 'getBundleInfoSynWithUserId17700004 getBundleInfo successfully: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG +'getBundleInfoSynWithUserId17700004 getBundleInfo catch failed: ' + message);
        expect(err.code).assertEqual(17700004);
        done();
      }
    });

    /*
    * @tc.number: Sub_Bms_getBundleInfoSyncNoUserId_401
    * @tc.name:  getBundleInfoSynNoUserId401
    * @tc.desc: test errCode 401 when call getBundleInfoSync
    */
    it('getBundleInfoSynNoUserId401', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + "getBundleInfoSynNoUserId401 start");
      try {
        let data = bundleManager.getBundleInfoSync(undefined, bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION);
        console.info(TAG + 'getBundleInfoSynNoUserId401 getBundleInfo successfully: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG +'getBundleInfoSynNoUserId401 getBundleInfo catch failed: ' + message);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
    * @tc.number: Sub_Bms_getBundleInfoSyncNoUserId_17700001
    * @tc.name:  getBundleInfoSynNoUserId17700001
    * @tc.desc: test errCode 17700001 when call getBundleInfoSync
    */
    it('getBundleInfoSynNoUserId17700001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + " getBundleInfoSynNoUserId17700001 start");
      try {
        let data = bundleManager.getBundleInfoSync("xxxx", bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION);
        console.info(TAG + 'getBundleInfoSynNoUserId17700001 getBundleInfo successfully: ' + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG +'getBundleInfoSynNoUserId17700001 getBundleInfo catch failed: ' + message);
        expect(err.code).assertEqual(17700001);
        done();
      }
    });



    /*
     * @tc.number: Sub_Bms_getAppCloneIdentity_401
     * @tc.name:  getAppCloneIdentity401
     * @tc.desc: test errCode 401 when call getAppCloneIdentity
    */
    it('getAppCloneIdentity401', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + "getAppCloneIdentity401 start");
      try {
        await bundleManager.getAppCloneIdentity(undefined).then((res) => {
          console.info(TAG + 'getAppCloneIdentity401  successfully: ' + JSON.stringify(res));
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          let message = (err as BusinessError).message;
          console.info(TAG +'getAppCloneIdentity401 getBundleInfo catch failed: ' + message);
          expect().assertFail();
          done();
        });

      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG +'getAppCloneIdentity401 catch failed: ' + message);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number: Sub_Bms_getAppCloneIdentity_17700021
     * @tc.name:  getAppCloneIdentity17700021
     * @tc.desc: test errCode 17700021 when call getAppCloneIdentity
    */
    it('getAppCloneIdentity17700021', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
      console.info(TAG + "getAppCloneIdentity17700021 start");
      try {
       await bundleManager.getAppCloneIdentity(-1).then((res) => {
          console.info(TAG + 'getAppCloneIdentity17700021 successfully: ' + JSON.stringify(res));
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          let message = (err as BusinessError).message;
          console.info(TAG +'getAppCloneIdentity17700021 getBundleInfo catch failed: ' + message);
          expect(err.code).assertEqual(17700021);
          done();
        });

      } catch (err) {
        let message = (err as BusinessError).message;
        console.info(TAG +'getAppCloneIdentity17700021 catch failed: ' + message);
        expect().assertFail();
        done();
      }
    });

  })
}

