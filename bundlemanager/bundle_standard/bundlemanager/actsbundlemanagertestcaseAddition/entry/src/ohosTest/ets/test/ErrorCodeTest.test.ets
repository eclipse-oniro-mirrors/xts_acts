
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
 
 let moduleName = 'testModule';
 let abilityName = 'ohos.acts.bundlemanagererrcode.test.MainAbility';
 let metadataName = 'ability_metadata';
 
 let extensionAbilityName = "ohos.acts.bundlemanagererrcode.test.FormAbility"
 
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
 
     /**
      * @tc.name   getProfileByAbilityCallBackundefined
      * @tc.number Sub_Bms_getProfileByAbility_1001
      * @tc.desc   test errCode 401 when call getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityCallBackundefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByAbilityCallBackundefined start");
       try {
         bundleManager.getProfileByAbility(undefined, abilityName, metadataName, (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByAbilityCallBackundefined  failed: ' + err.message);
             expect().assertFail()
             done();
           } else {
             console.info(TAG + 'getProfileByAbilityCallBackundefined successfully: ' + JSON.stringify(data));
             expect().assertFail();
             done();
           }
         });
 
       } catch (exception) {
         console.error(`getProfileByAbilityCallBackundefined catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect(exception.code).assertEqual(401);
         done();
       }
 
     });
 
 
     /**
      * @tc.name   getProfileByAbilityCallBackNull
      * @tc.number Sub_Bms_getProfileByAbility_1002
      * @tc.desc   test errCode 401 when call getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityCallBackNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByAbilityCallBackNul start");
       try {
         bundleManager.getProfileByAbility(undefined, abilityName, metadataName, (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByAbilityCallBackNull  failed: ' + err.message);
             expect().assertFail()
             done();
           } else {
             console.info(TAG + 'getProfileByAbilityCallBackNull successfully: ' + JSON.stringify(data));
             expect().assertFail();
             done();
           }
         });
 
       } catch (exception) {
         console.error(`getProfileByAbilityCallBackNull catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect(exception.code).assertEqual(401);
         done();
       }
 
     });
 
 
     /**
      * @tc.name   getProfileByAbilityCallBackEmpty
      * @tc.number Sub_Bms_getProfileByAbility_1003
      * @tc.desc   test errCode 17700002 when call getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityCallBackEmpty', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByAbilityCallBackEmpty start");
       try {
         bundleManager.getProfileByAbility("", abilityName, metadataName, (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByAbilityCallBackEmpty  failed: ' + err.message);
             expect(err.code).assertEqual(17700002)
             done();
           } else {
             console.info(TAG + 'getProfileByAbilityCallBackNull successfully: ' + JSON.stringify(data));
             expect().assertFail();
             done();
           }
         });
 
       } catch (exception) {
         console.error(`getProfileByAbilityCallBackNull catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail();
         done();
       }
 
     });
 
 
 
 
     /**
      * @tc.name   getProfileByAbilityCallBackundefinedX
      * @tc.number Sub_Bms_getProfileByAbility_1004
      * @tc.desc   test errCode 401 when call getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityCallBackundefinedX', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByAbilityCallBackundefinedX start");
       try {
         bundleManager.getProfileByAbility(moduleName, undefined, metadataName, (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByAbilityCallBackundefinedX  failed: ' + err.message);
             expect().assertFail()
             done();
           } else {
             console.info(TAG + 'getProfileByAbilityCallBackundefinedX successfully: ' + JSON.stringify(data));
             expect().assertFail();
             done();
           }
         });
 
       } catch (exception) {
         console.error(`getProfileByAbilityCallBackundefinedX catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect(exception.code).assertEqual(401);
         done();
       }
 
     });
 
 
     /**
      * @tc.name   getProfileByAbilityCallBackNullX
      * @tc.number Sub_Bms_getProfileByAbility_1005
      * @tc.desc   test errCode 401 when call getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityCallBackNullX', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByAbilityCallBackNulX start");
       try {
         bundleManager.getProfileByAbility(moduleName, null, metadataName, (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByAbilityCallBackNullX  failed: ' + err.message);
             expect().assertFail()
             done();
           } else {
             console.info(TAG + 'getProfileByAbilityCallBackNullX successfully: ' + JSON.stringify(data));
             expect().assertFail();
             done();
           }
         });
 
       } catch (exception) {
         console.error(`getProfileByAbilityCallBackNullX catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect(exception.code).assertEqual(401);
         done();
       }
 
     });
 
 
     /**
      * @tc.name   getProfileByAbilityCallBackEmptyX
      * @tc.number Sub_Bms_getProfileByAbility_1006
      * @tc.desc   test errCode 17700003 when call getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityCallBackEmptyX', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByAbilityCallBackEmpty start");
       try {
         bundleManager.getProfileByAbility(moduleName, "", metadataName, (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByAbilityCallBackEmpty  failed: ' + err.message);
             expect(err.code).assertEqual(17700003)
             done();
           } else {
             console.info(TAG + 'getProfileByAbilityCallBackNullX successfully: ' + JSON.stringify(data));
             expect().assertFail();
             done();
           }
         });
 
       } catch (exception) {
         console.error(`getProfileByAbilityCallBackNullX catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail();
         done();
       }
 
     });
 
 
     /**
      * @tc.name   getProfileByAbilityCallBackundefinedX3
      * @tc.number Sub_Bms_getProfileByAbility_1007
      * @tc.desc   test errCode 401 when call getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityCallBackundefinedX3', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByAbilityCallBackundefinedX3 start " + abilityName);
       try {
         bundleManager.getProfileByAbility(moduleName, abilityName, undefined, (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByAbilityCallBackundefinedX3  failed: ' + err.message);
             expect().assertFail()
             done();
           } else {
             console.info(TAG + 'getProfileByAbilityCallBackundefinedX3 successfully: ' + JSON.stringify(data));
             expect(data.length >0).assertTrue()
             done();
           }
         });
 
       } catch (exception) {
         console.error(`getProfileByAbilityCallBackundefinedX3 catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail();
         done();
       }
 
     });
 
 
     /**
      * @tc.name   getProfileByAbilityCallBackNullX3
      * @tc.number Sub_Bms_getProfileByAbility_1008
      * @tc.desc   test errCode 401 when call getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityCallBackNullX3', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByAbilityCallBackNulX3 start");
       try {
         bundleManager.getProfileByAbility(moduleName, abilityName, null, (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByAbilityCallBackNullX3  failed: ' + err.message);
             expect().assertFail()
             done();
           } else {
             console.info(TAG + 'getProfileByAbilityCallBackNullX3 successfully: ' + JSON.stringify(data));
             expect(data.length >0).assertTrue()
             done();
           }
         });
 
       } catch (exception) {
         console.error(`getProfileByAbilityCallBackNullX3 catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail();
         done();
       }
 
     });
 
 
     /**
      * @tc.name   getProfileByAbilityCallBackEmptyX3
      * @tc.number Sub_Bms_getProfileByAbility_1009
      * @tc.desc   test errCode 17700003 when call getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityCallBackEmptyX3', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByAbilityCallBackEmptyX3 start");
       try {
         bundleManager.getProfileByAbility(moduleName, abilityName, "", (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByAbilityCallBackEmptyX3   failed: ' + err.message);
             expect().assertFail();
             done();
           } else {
             console.info(TAG + 'getProfileByAbilityCallBackNullX3 successfully: ' + JSON.stringify(data));
             expect(data.length > 0 ).assertTrue();
             done();
           }
         });
 
       } catch (exception) {
         console.error(`getProfileByAbilityCallBackNullX3 catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail();
         done();
       }
 
     });
 
 
     /**
      * @tc.name   getProfileByAbilityPromiseNull
      * @tc.number Sub_Bms_getProfileByAbility_1010
      * @tc.desc   test errCode 401 when call  getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityPromiseNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByAbilityPromise401 start");
       try {
         await bundleManager.getProfileByAbility(null, abilityName,metadataName).then((data) => {
           console.info(TAG + 'getProfileByAbilityPromiseNull successfully: ' + JSON.stringify(data));
           expect().assertFail();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByAbilityPromiseNull failed: ' + err.message);
           expect().assertFail();
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByAbilityPromiseNull catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect(exception.code).assertEqual(401);
         done();
       }
 
     });
 
 
     /**
      * @tc.name   getProfileByAbilityPromiseUndefined
      * @tc.number Sub_Bms_getProfileByAbility_1011
      * @tc.desc   test errCode 401 when call  getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityPromiseUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByAbilityPromiseUndefined401 start");
       try {
         await bundleManager.getProfileByAbility(undefined, abilityName,metadataName).then((data) => {
           console.info(TAG + 'getProfileByAbilityPromiseUndefined successfully: ' + JSON.stringify(data));
           expect().assertFail();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByAbilityPromiseUndefined failed: ' + err.message);
           expect().assertFail();
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByAbilityPromiseUndefined catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect(exception.code).assertEqual(401);
         done();
       }
 
     });
 
     /**
      * @tc.name   getProfileByAbilityPromiseEmpty
      * @tc.number Sub_Bms_getProfileByAbility_1012
      * @tc.desc   test errCode 401 when call  getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityPromiseEmpty', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByAbilityPromiseEmpty start");
       try {
         await bundleManager.getProfileByAbility("", abilityName,metadataName).then((data) => {
           console.info(TAG + 'getProfileByAbilityPromiseEmpty successfully: ' + JSON.stringify(data));
           expect().assertFail();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByAbilityPromiseEmpty failed: ' + err.message);
           expect(err.code).assertEqual(17700002)
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByAbilityPromiseEmpty catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail();
         done();
       }
 
     });
 
 
     /**
      * @tc.name   getProfileByAbilityPromiseNullx
      * @tc.number Sub_Bms_getProfileByAbility_1013
      * @tc.desc   test errCode 401 when call  getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityPromiseNullx', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByAbilityPromiseNullx start");
       try {
         await bundleManager.getProfileByAbility(moduleName, null,metadataName).then((data) => {
           console.info(TAG + 'getProfileByAbilityPromiseNullx successfully: ' + JSON.stringify(data));
           expect().assertFail();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByAbilityPromiseNullx failed: ' + err.message);
           expect().assertFail();
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByAbilityPromiseNullx catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect(exception.code).assertEqual(401);
         done();
       }
 
     });
 
 
     /**
      * @tc.name   getProfileByAbilityPromiseUndefinedx
      * @tc.number Sub_Bms_getProfileByAbility_1014
      * @tc.desc   test errCode 401 when call  getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityPromiseUndefinedx', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "etProfileByAbilityPromiseUndefinedx start");
       try {
         await bundleManager.getProfileByAbility(moduleName, undefined,metadataName).then((data) => {
           console.info(TAG + 'getProfileByAbilityPromiseUndefinedx successfully: ' + JSON.stringify(data));
           expect().assertFail();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByAbilityPromiseUndefinedx failed: ' + err.message);
           expect().assertFail();
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByAbilityPromiseUndefinedx catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect(exception.code).assertEqual(401);
         done();
       }
 
     });
 
     /**
      * @tc.name   getProfileByAbilityPromiseEmptyx
      * @tc.number Sub_Bms_getProfileByAbility_1015
      * @tc.desc   test errCode 401 when call  getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityPromiseEmptyx', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByAbilityPromiseEmptyx start");
       try {
         await bundleManager.getProfileByAbility(moduleName, "",metadataName).then((data) => {
           console.info(TAG + 'getProfileByAbilityPromiseEmptyx successfully: ' + JSON.stringify(data));
           expect().assertFail();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByAbilityPromiseEmptyx failed: ' + err.message);
           expect(err.code).assertEqual(17700003)
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByAbilityPromiseEmptyx catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail();
         done();
       }
 
     });
 
 
 
     /**
      * @tc.name   getProfileByAbilityPromiseNullx3
      * @tc.number Sub_Bms_getProfileByAbility_1016
      * @tc.desc   test errCode 401 when call  getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityPromiseNullx3', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByAbilityPromiseNullx3 start");
       try {
         await bundleManager.getProfileByAbility(moduleName, abilityName, null).then((data) => {
           console.info(TAG + 'getProfileByAbilityPromiseNullx3 successfully: ' + JSON.stringify(data));
           expect(data.length > 0 ).assertTrue();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByAbilityPromiseNullx3 failed: ' + err.message);
           expect().assertFail();
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByAbilityPromiseNullx3 catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail()
         done();
       }
 
     });
 
 
     /**
      * @tc.name   getProfileByAbilityPromiseUndefinedx3
      * @tc.number Sub_Bms_getProfileByAbility_1017
      * @tc.desc   test errCode 401 when call  getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityPromiseUndefinedx3', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "etProfileByAbilityPromiseUndefinedx3 start");
       try {
         await bundleManager.getProfileByAbility(moduleName, abilityName, undefined).then((data) => {
           console.info(TAG + 'getProfileByAbilityPromiseUndefinedx3 successfully: ' + JSON.stringify(data));
           expect(data.length > 0 ).assertTrue();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByAbilityPromiseUndefinedx3 failed: ' + err.message);
           expect().assertFail();
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByAbilityPromiseUndefinedx3 catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail()
         done();
       }
 
     });
 
     /**
      * @tc.name   getProfileByAbilityPromiseEmptyx3
      * @tc.number Sub_Bms_getProfileByAbility_1018
      * @tc.desc   test errCode 401 when call  getProfileByAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByAbilityPromiseEmptyx3', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByAbilityPromiseEmptyx3 start");
       try {
         await bundleManager.getProfileByAbility(moduleName, abilityName , "").then((data) => {
           console.info(TAG + 'getProfileByAbilityPromiseEmptyx3 successfully: ' + JSON.stringify(data));
           expect(data.length > 0 ).assertTrue();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByAbilityPromiseEmptyx3 failed: ' + err.message);
           expect().assertFail()
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByAbilityPromiseEmptyx3 catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail();
         done();
       }
 
     });
 
     /**
      * @tc.name   getProfileByExtensionAbilityUndefined
      * @tc.number Sub_Bms_getProfileByExtensionAbility_1019
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByExtensionAbilityUndefined start");
       try {
         bundleManager.getProfileByExtensionAbility(undefined, extensionAbilityName, metadataName, (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByExtensionAbilityUndefined failed: ' + err.message);
             expect().assertFail();
             done();
           } else {
             console.info(TAG + 'getProfileByExtensionAbilityUndefined successfully: ' + JSON.stringify(data));
             expect().assertFail();
             done();
           }
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityUndefined catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect(exception.code).assertEqual(401);
         done();
       }
     });
 
 
     /**
      * @tc.name   getProfileByExtensionAbilityNull
      * @tc.number Sub_Bms_getProfileByExtensionAbility_1020
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByExtensionAbilityNull start");
       try {
         bundleManager.getProfileByExtensionAbility(null, extensionAbilityName, metadataName, (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByExtensionAbilityNull failed: ' + err.message);
             expect().assertFail();
             done();
           } else {
             console.info(TAG + 'getProfileByExtensionAbilityNull successfully: ' + JSON.stringify(data));
             expect().assertFail();
             done();
           }
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityNull catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect(exception.code).assertEqual(401);
         done();
       }
     });
 
 
     /**
      * @tc.name   getProfileByExtensionAbilityEmpty
      * @tc.number Sub_Bms_getProfileByExtensionAbility_10210
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityEmpty', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByExtensionAbilityEmpty start");
       try {
         bundleManager.getProfileByExtensionAbility("", extensionAbilityName, metadataName, (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByExtensionAbilityEmpty failed: ' + err.message);
             expect(err.code).assertEqual(17700002);
             done();
           } else {
             console.info(TAG + 'getProfileByExtensionAbilityEmpty successfully: ' + JSON.stringify(data));
             expect().assertFail();
             done();
           }
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityEmpty catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail();
         done();
       }
     });
 
 
 
 
 
     /**
      * @tc.name   getProfileByExtensionAbilityUndefinedx
      * @tc.number Sub_Bms_getProfileByExtensionAbility_10220
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityUndefinedx', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByExtensionAbilityUndefinedx start");
       try {
         bundleManager.getProfileByExtensionAbility(moduleName, undefined, metadataName, (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByExtensionAbilityUndefinedx failed: ' + err.message);
             expect().assertFail();
             done();
           } else {
             console.info(TAG + 'getProfileByExtensionAbilityUndefinedx successfully: ' + JSON.stringify(data));
             expect().assertFail();
             done();
           }
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityUndefinedx catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect(exception.code).assertEqual(401);
         done();
       }
     });
 
 
     /**
      * @tc.name   getProfileByExtensionAbilityNullx
      * @tc.number Sub_Bms_getProfileByExtensionAbility_1021
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityNullx', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByExtensionAbilityNullx start");
       try {
         bundleManager.getProfileByExtensionAbility(moduleName, null, metadataName, (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByExtensionAbilityNullx failed: ' + err.message);
             expect().assertFail();
             done();
           } else {
             console.info(TAG + 'getProfileByExtensionAbilityNullx successfully: ' + JSON.stringify(data));
             expect().assertFail();
             done();
           }
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityNullx catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect(exception.code).assertEqual(401);
         done();
       }
     });
 
 
     /**
      * @tc.name   getProfileByExtensionAbilityEmptyx
      * @tc.number Sub_Bms_getProfileByExtensionAbility_1022
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityEmptyx', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByExtensionAbilityEmptyx start");
       try {
         bundleManager.getProfileByExtensionAbility(moduleName, "", metadataName, (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByExtensionAbilityEmptyx failed: ' + err.message);
             expect(err.code).assertEqual(17700003);
             done();
           } else {
             console.info(TAG + 'getProfileByExtensionAbilityEmptyx successfully: ' + JSON.stringify(data));
             expect().assertFail();
             done();
           }
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityEmptyx catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail();
         done();
       }
     });
 
 
     /**
      * @tc.name   getProfileByExtensionAbilityUndefinedx3
      * @tc.number Sub_Bms_getProfileByExtensionAbility_1023
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityUndefinedx3', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByExtensionAbilityUndefinedx3 start");
       try {
         bundleManager.getProfileByExtensionAbility(moduleName, extensionAbilityName, undefined, (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByExtensionAbilityUndefinedx3 failed: ' + err.message);
             expect().assertFail();
             done();
           } else {
             console.info(TAG + 'getProfileByExtensionAbilityUndefinedx3 successfully: ' + JSON.stringify(data));
             expect(data.length > 0 ).assertTrue();
             done();
           }
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityUndefinedx3 catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail();
         done();
       }
     });
 
 
     /**
      * @tc.name   getProfileByExtensionAbilityNullx3
      * @tc.number Sub_Bms_getProfileByExtensionAbility_1024
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityNullx3', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByExtensionAbilityNullx start");
       try {
         bundleManager.getProfileByExtensionAbility(moduleName,extensionAbilityName, null, (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByExtensionAbilityNullx3 failed: ' + err.message);
             expect().assertFail();
             done();
           } else {
             console.info(TAG + 'getProfileByExtensionAbilityNullx3 successfully: ' + JSON.stringify(data));
             expect(data.length > 0 ).assertTrue();
             done();
           }
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityNullx3 catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail();
         done();
       }
     });
 
 
     /**
      * @tc.name   getProfileByExtensionAbilityEmptyx3
      * @tc.number Sub_Bms_getProfileByExtensionAbility_1025
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityEmptyx3', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByExtensionAbilityEmptyx3 start");
       try {
         bundleManager.getProfileByExtensionAbility(moduleName, extensionAbilityName, "", (err:BusinessError, data:Array<string>) => {
           if (err) {
             console.info(TAG + 'getProfileByExtensionAbilityEmptyx3 failed: ' + err.message);
             expect().assertFail();
             done();
           } else {
             console.info(TAG + 'getProfileByExtensionAbilityEmptyx3 successfully: ' + JSON.stringify(data));
             expect(data.length > 0 ).assertTrue();
             done();
           }
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityEmptyx3 catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail();
         done();
       }
     });
 
 
     /**
      * @tc.name   getProfileByExtensionAbilityPromiseUndefined
      * @tc.number Sub_Bms_getProfileByExtensionAbility_1026
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityPromiseUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByExtensionAbilityPromiseundefined start");
       try {
         await bundleManager.getProfileByExtensionAbility(undefined, extensionAbilityName, metadataName).then((data) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseundefined successfully: ' + JSON.stringify(data));
           expect().assertFail();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseundefined failed: ' + err.message);
           expect().assertFail();
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityPromiseundefined catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect(exception.code).assertEqual(401);
         done();
       }
     });
 
     /**
      * @tc.name   getProfileByExtensionAbilityPromiseNull
      * @tc.number Sub_Bms_getProfileByExtensionAbility_1027
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityPromiseNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "etProfileByExtensionAbilityPromiseNull start");
       try {
         await bundleManager.getProfileByExtensionAbility(null, extensionAbilityName,metadataName).then((data) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseNull successfully: ' + JSON.stringify(data));
           expect().assertFail();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseNull failed: ' + err.message);
           expect().assertFail();
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityPromiseNull catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect(exception.code).assertEqual(401);
         done();
       }
     });
 
 
     /**
      * @tc.name   getProfileByExtensionAbilityPromiseEmpty
      * @tc.number Sub_Bms_getProfileByExtensionAbility_1028
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityPromiseEmpty', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByExtensionAbilityPromiseEmpty start");
       try {
         await bundleManager.getProfileByExtensionAbility("", extensionAbilityName,metadataName).then((data) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseEmpty successfully: ' + JSON.stringify(data));
           expect().assertFail();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseEmpty failed: ' + err.message);
           expect(err.code).assertEqual(17700002)
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityPromiseEmpty catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail();
         done();
       }
     });
 
 
     /**
      * @tc.name   getProfileByExtensionAbilityPromiseUndefinedx
      * @tc.number Sub_Bms_getProfileByExtensionAbility_1029
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityPromiseUndefinedx', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByExtensionAbilityPromiseundefined start");
       try {
         await bundleManager.getProfileByExtensionAbility(moduleName, undefined, metadataName).then((data) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseundefinedx successfully: ' + JSON.stringify(data));
           expect().assertFail();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseundefinedx failed: ' + err.message);
           expect().assertFail();
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityPromiseundefinedx catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect(exception.code).assertEqual(401);
         done();
       }
     });
 
     /**
      * @tc.name   getProfileByExtensionAbilityPromiseNullx
      * @tc.number Sub_Bms_getProfileByExtensionAbility_1030
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityPromiseNullx', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "etProfileByExtensionAbilityPromiseNull start");
       try {
         await bundleManager.getProfileByExtensionAbility(moduleName, null, metadataName).then((data) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseNullx successfully: ' + JSON.stringify(data));
           expect().assertFail();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseNullx failed: ' + err.message);
           expect().assertFail();
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityPromiseNullx catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect(exception.code).assertEqual(401);
         done();
       }
     });
 
 
     /**
      * @tc.name   getProfileByExtensionAbilityPromiseEmptyx
      * @tc.number Sub_Bms_getProfileByExtensionAbility_10310
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityPromiseEmptyx', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByExtensionAbilityPromiseEmptyx start");
       try {
         await bundleManager.getProfileByExtensionAbility(moduleName, "",metadataName).then((data) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseEmptyx successfully: ' + JSON.stringify(data));
           expect().assertFail();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseEmpty3 failed: ' + err.message);
           expect(err.code).assertEqual(17700003)
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityPromiseEmpty3 catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail();
         done();
       }
     });
 
 
 
 
     /**
      * @tc.name   getProfileByExtensionAbilityPromiseUndefinedx3
      * @tc.number Sub_Bms_getProfileByExtensionAbility_1032
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityPromiseUndefinedx3', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByExtensionAbilityPromiseundefinedx3 start");
       try {
         await bundleManager.getProfileByExtensionAbility(moduleName, extensionAbilityName, undefined).then((data) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseundefinedx3 successfully: ' + JSON.stringify(data));
           expect(data.length > 0 ).assertTrue();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseundefinedx3 failed: ' + err.message);
           expect().assertFail();
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityPromiseundefinedx3 catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail()
         done();
       }
     });
 
     /**
      * @tc.name   getProfileByExtensionAbilityPromiseNullx3
      * @tc.number Sub_Bms_getProfileByExtensionAbility_1031
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityPromiseNullx3', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "etProfileByExtensionAbilityPromiseNullx3 start");
       try {
         await bundleManager.getProfileByExtensionAbility(moduleName, extensionAbilityName, null).then((data) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseNullx3 successfully: ' + JSON.stringify(data));
           expect(data.length > 0 ).assertTrue();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseNullx3 failed: ' + err.message);
           expect().assertFail();
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityPromiseNullx3 catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail()
         done();
       }
     });
 
 
     /**
      * @tc.name   getProfileByExtensionAbilityPromiseEmptyx3
      * @tc.number Sub_Bms_getProfileByExtensionAbility_1033
      * @tc.desc   test errCode 401 when call getProfileByExtensionAbility
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('getProfileByExtensionAbilityPromiseEmptyx3', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) =>  {
       console.info(TAG + "getProfileByExtensionAbilityPromiseEmptyx start");
       try {
         await bundleManager.getProfileByExtensionAbility(moduleName, extensionAbilityName, "").then((data) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseEmptyx successfully: ' + JSON.stringify(data));
           expect(data.length > 0 ).assertTrue();
           done();
         }).catch((err: BusinessError) => {
           console.info(TAG + 'getProfileByExtensionAbilityPromiseEmpty3 failed: ' + err.message);
           expect().assertFail()
           done();
         });
 
       } catch (exception) {
         console.error(`Failed to getProfileByExtensionAbilityPromiseEmpty3x catch. Cause code: ${exception.code}, message: ${exception.message}`);
         expect().assertFail();
         done();
       }
     });
     
   })
 }
 
 