/*
* Copyright (c) 2025-2026 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import dataPreferences from '@ohos.data.preferences'
import common from "@ohos.app.ability.common";
import { BusinessError } from "@ohos.base"
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'

let domain: int = 0x0000;
let tag: string = 'testTag';
hilog.info(domain, tag, '%{public}s', '================ export preferencetest start ....');
const KEY_TEST_DOUBLE_ELEMENT = 'key_test_double';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean';
const KEY_TEST_DOUBLE_ARRAY_ELEMENT = 'key_test_double_array';
const KEY_TEST_BIGINT_ELEMENT = 'key_test_bigint';
const KEY_TEST_UINT8ARRAY_ELEMENT = 'key_test_uint8array';
const KEY_TEST_OBJECT_ELEMENT = 'key_test_object';
const KEY_TEST_INT_ARRAY_ELEMENT = 'key_test_int_array';
const KEY_TEST_NUMBER_ARRAY_ELEMENT = 'key_test_number_array';
const MAX_KEY_LENGTH = 'X'.repeat(1024);
const NAME = 'test_preferences';
const NAME1 = "getPreferencesTest";
const KEY_TEST_INT_ELEMENT = 'key_test_int';
const KEY_TEST_LONG_ELEMENT = 'key_test_long';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float';
const KEY_TEST_STRING_ARRAY_ELEMENT = 'key_test_string_array';
const KEY_TEST_BOOL_ARRAY_ELEMENT = 'key_test_bool_array';

let mPreferences: dataPreferences.Preferences | undefined;
let context: common.UIAbilityContext | undefined;
const TAG = '[PREFERENCES_CALLBACK_JSUNIT_TEST]'

class User {
  name: string = '';
  age: int;
  salary: double
};

class Company {
  cName: string = '';
  enName: string = '';
  year: int;
  money: BigInt = 0n;
  isActive: boolean = false;
  groups: string[] = [];
  users: User[] = [];
}

export default function preferenceTest() {
  describe('preferenceTest', (): void =>  {
    beforeAll (() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll')
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          context = abilitys.context
          context!.stageMode = true;
          hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');
        },
      }, (err : BusinessError | null) : void => {
        if(err && err.code != 0){
          hilog.info(domain, tag, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.preferences");
      await Utils.msSleep(6000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })


    afterAll(() => {
      hilog.info(domain, tag, '%{public}s', 'afterAll')
    })

    beforeEach(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeEach, stagemode is ' + context!.stageMode)
      mPreferences = await dataPreferences.getPreferences(context!, NAME);
      mPreferences!.clearSync();
      mPreferences!.flush();
    })

    afterEach(() => {
      hilog.info(domain, tag, '%{public}s', 'afterEach')
      await dataPreferences.deletePreferences(context!, NAME);
    })

    /**
     * @tc.name   testPreferencesGetPreferences0001
     * @tc.number SUB_DistributedData_Preference_SDK_GetSyn_strong_basis_EtsApiTest_2200
     * @tc.desc   GetSyn promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPreferencesGetPreferences0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const NAME = 'getPreferencesTest'
      dataPreferences.getPreferences(context!, NAME, (err : BusinessError | null, preferences : dataPreferences.Preferences|undefined) :void  => {
        if(err && err.code != 0){
          hilog.info(domain, tag, '%{public}s', TAG + "Get preferences err: " + err + "code:" + JSON.stringify(err))
          expect(false).assertTrue();
        }else{
          hilog.info(domain, tag, '%{public}s', TAG + "Get preferences success")
          console.log("Get preferences success");
          expect(preferences != undefined).assertTrue();
        }
      })
      done()
    })


    /**
     * @tc.name   testPreferencesDeletePreferencesOptionsPromise_0100
     * @tc.number SUB_DistributedData_Preference_SDK_GetSyn_strong_basis_EtsApiTest_2300
     * @tc.desc   GetSyn promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPreferencesDeletePreferencesOptionsPromise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const options_ : dataPreferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: null,
      };
      try {
        hilog.info(domain, tag, '%{public}s', `getPreferences start.`);
        dataPreferences.getPreferences(context!, options_).then(async (data : dataPreferences.Preferences) :  Promise<void> => {
          hilog.info(domain, tag, '%{public}s', `getPreferences successfully.`);
          expect(data!=null).assertTrue();
          dataPreferences.deletePreferences(context!, options_).then(async () :  Promise<void> => {
            hilog.info(domain, tag, '%{public}s', `deletePreferences successfully.`);
            done();
          }).catch((err: Error) : void => {
            expect().assertFail();
          })
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', `111 errInfo is :` + err);
          expect().assertFail();
        })
      } catch (errInfo) {
        hilog.info(domain, tag, '%{public}s', `222 errInfo is :` + errInfo);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testPreferencesDeletePreferencesOptionsPromise_0200
     * @tc.number SUB_DistributedData_Preference_SDK_GetSyn_strong_basis_EtsApiTest_2400
     * @tc.desc   GetSyn promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPreferencesDeletePreferencesOptionsPromise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const options_ : dataPreferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: null,
      };
      hilog.info(domain, tag, '%{public}s', `getPreferences start.`);
      dataPreferences.getPreferences(context!, options_, (err : BusinessError | null, preferences : dataPreferences.Preferences | undefined) :void  => {
        if(err && err.code != 0){
          hilog.info(domain, tag, '%{public}s', TAG + "Get preferences err: " + err + "code:" + JSON.stringify(err))
          expect(false).assertTrue();
        }else{
          hilog.info(domain, tag, '%{public}s', TAG + "Get preferences success")
          expect(preferences != null).assertTrue();
          dataPreferences.deletePreferences(context!, options_, (err : BusinessError | null) : void => {
            if(err && err.code != 0){
              hilog.info(domain, tag, '%{public}s', TAG + "Delete preferences err: " + err)
              expect(false).assertTrue();
            }else{
              hilog.info(domain, tag, '%{public}s', TAG + "Delete preferences success")
            }
          })
        }
      })
      try {
        hilog.info(domain, tag, '%{public}s', `getPreferences start.`);
        dataPreferences.getPreferences(context!, options_).then(async (data : dataPreferences.Preferences) :  Promise<void> => {
          hilog.info(domain, tag, '%{public}s', `getPreferences successfully.`);
          expect(data!=null).assertTrue();
          dataPreferences.deletePreferences(context!, options_).then(async () :  Promise<void> => {
            hilog.info(domain, tag, '%{public}s', `deletePreferences successfully.`);
            done();
          }).catch((err: Error) : void => {
            expect().assertFail();
          })
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', `111 errInfo is :` + err);
          expect().assertFail();
        })
      } catch (errInfo) {
        hilog.info(domain, tag, '%{public}s', `222 errInfo is :` + errInfo);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   PreferencesGetSync0100
     * @tc.number SUB_DistributedData_Preference_SDK_GetSyn_strong_basis_EtsApiTest_0100
     * @tc.desc   GetSyn promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PreferencesGetSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      mPreferences!.clearSync();
      const ret = mPreferences!.getSync(KEY_TEST_STRING_ELEMENT, "defaultValue");
      expect('defaultValue').assertEqual(ret);
      done();
    })

    /**
     * @tc.name   PreferencesPutSync0100
     * @tc.number SUB_DistributedData_Preference_SDK_PutSync_strong_basis_EtsApiTest_0200
     * @tc.desc   PutSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PreferencesPutSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'ttt  PreferencesPutSync0100 start');

      mPreferences!.clearSync();
      hilog.info(domain, tag, '%{public}s', 'ttt  PreferencesPutSync0100 start 2');

      const doubleVar = 6.666;
      mPreferences!.putSync(KEY_TEST_DOUBLE_ELEMENT, 6.666);
      mPreferences!.putSync("55555", 6.666);

      const stringVar = "6.666";
      mPreferences!.putSync(KEY_TEST_STRING_ELEMENT, stringVar);

      const boolVar = true;
      mPreferences!.putSync(KEY_TEST_BOOLEAN_ELEMENT, boolVar);

      const doubleArrVar = new Array<double>(1, 2, 3);
      mPreferences!.putSync(KEY_TEST_DOUBLE_ARRAY_ELEMENT, doubleArrVar);

      const stringArr = new Array<string>('1', '2', '3');
      mPreferences!.putSync(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);

      hilog.info(domain, tag, '%{public}s', 'ttt  PreferencesPutSync0100 start before bigint');
      const Num = BigInt("-12345678912345678912345678971234567123456");
      mPreferences!.putSync(KEY_TEST_BIGINT_ELEMENT, Num);

      const uInt8Array = new Uint8Array(16);
      uInt8Array.fill(100);
      mPreferences!.putSync(KEY_TEST_UINT8ARRAY_ELEMENT, uInt8Array);

      mPreferences!.flush();

      let resDouble = mPreferences!.getSync(KEY_TEST_DOUBLE_ELEMENT, 0) as double;
      expect(resDouble).assertEqual(doubleVar);

      let resString = mPreferences!.getSync(KEY_TEST_STRING_ELEMENT, "") as string;
      expect(resString).assertEqual(stringVar);

      let resBool = mPreferences!.getSync(KEY_TEST_BOOLEAN_ELEMENT, false) as boolean;
      expect(resBool).assertEqual(boolVar);

      let resDoubleArr = mPreferences!.getSync(KEY_TEST_DOUBLE_ARRAY_ELEMENT, new Array<double>()) as Array<double>;
      for (let i = 0; i < doubleArrVar.length; i++) {
        hilog.info(domain, tag, '%{public}s', 'ttt  pre = ' + doubleArrVar[i] + '   now = ' + resDoubleArr[i]);
        expect(doubleArrVar[i]).assertEqual(resDoubleArr[i]);
      }

      let resStringArr = mPreferences!.getSync(KEY_TEST_STRING_ARRAY_ELEMENT, new Array<string>()) as Array<string>;
      for (let i = 0; i < stringArr.length; i++) {
        hilog.info(domain, tag, '%{public}s', 'ttt  pre = ' + stringArr[i] + '   now = ' + resStringArr[i]);
        expect(stringArr[i]).assertEqual(resStringArr[i]);
      }

      hilog.info(domain, tag, '%{public}s', 'ttt  PreferencesPutSync0100 start get Uint8Array');
      let resUint8Array = mPreferences!.getSync(KEY_TEST_UINT8ARRAY_ELEMENT, new Uint8Array()) as Uint8Array;
      hilog.info(domain, tag, '%{public}s', 'ttt  PreferencesPutSync0100 get Uint8Array success');
      hilog.info(domain, tag, '%{public}s', 'ttt  PreferencesPutSync0100 get Uint8Array success' + JSON.stringify(resUint8Array));
      hilog.info(domain, tag, '%{public}s', 'ttt  PreferencesPutSync0100 get Uint8Array success' + resUint8Array.length);
      for (let i = 0; i < resUint8Array.length; i++) {
        hilog.info(domain, tag, '%{public}s', 'ttt  pre = ' + uInt8Array[i] + '   now = ' + resUint8Array[i]);
        expect(resUint8Array[i]).assertEqual(uInt8Array[i]);
      }

      let allRes = mPreferences!.getAllSync() as Object;
      hilog.info(domain, tag, '%{public}s', 'PreferencesEtsKit all = ' + JSON.stringify(allRes));

      done();
    });


    /**
     * @tc.name   testPreferencesPutArrayNumber001
     * @tc.number SUB_DistributedData_Preference_SDK_PutSync_strong_basis_EtsApiTest_2500
     * @tc.desc   PutArrayNumber promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesPutArrayNumber001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences!.clear();
      mPreferences!.put(KEY_TEST_INT_ARRAY_ELEMENT, new Array<number>(1, 2, 3), (err: BusinessError | null) :void => {
        let pre = await mPreferences!.get(KEY_TEST_INT_ARRAY_ELEMENT, 0) as Array<number>;
        expect(3).assertEqual(pre.length);
        done();
      });
    })


    /**
     * @tc.name   testPreferencesPutFlushRemoveGet_0300
     * @tc.number SUB_DistributedData_Preference_SDK_Flush_strong_basis_EtsApiTest_0300
     * @tc.desc   Flush promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesPutFlushRemoveGet_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', TAG + "start_test_0300");
      if (mPreferences == null) {
        hilog.info(domain, tag, '%{public}s', TAG + "mPreferences is null.");
      }
      await mPreferences!.clear();
      await mPreferences!.put(KEY_TEST_FLOAT_ELEMENT, 111.2).then(async () : Promise<void> => {
        hilog.info(domain, tag, '%{public}s', TAG + "put succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "put failed error message = " + err);
      })

      await mPreferences!.get(KEY_TEST_FLOAT_ELEMENT, 111.2).then(async (res1 : dataPreferences.ValueType) : Promise<void> => {
        expect(111.2).assertEqual(res1);
        hilog.info(domain, tag, '%{public}s', TAG + "res1 = " + res1 + "get res1 succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "get res1 failed error message = " + err);
      })

      await mPreferences!.flush().then(() => {
        hilog.info(domain, tag, '%{public}s', TAG + "flush succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "flush failed error message = " + err);
      })

      await dataPreferences.removePreferencesFromCache(context!, NAME).then(async () :  Promise<void> => {
        hilog.info(domain, tag, '%{public}s', TAG + "remove succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "remove failed error message = " + err);
      })

      mPreferences = await dataPreferences.getPreferences(context!, NAME);

      await mPreferences!.get(KEY_TEST_FLOAT_ELEMENT, 111.2).then(async (res2 : dataPreferences.ValueType) :  Promise<void> => {
        expect(111.2).assertEqual(res2);
        hilog.info(domain, tag, '%{public}s', TAG + "res2 = " + res2 + "get res2 succeed. test0300end");
        done();
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "get res2 failed error message = " + err);
      })
    })


    /**
     * @tc.name   testPreferencesGetFloat0100
     * @tc.number SUB_DistributedData_Preference_SDK_GetFloat_strong_basis_EtsApiTest_0400
     * @tc.desc   GetFloat promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesGetFloat0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences!.clear();
      await mPreferences!.put(KEY_TEST_FLOAT_ELEMENT, 3.0);
      mPreferences!.get(KEY_TEST_FLOAT_ELEMENT, 0.0, (err: BusinessError | null, ret: dataPreferences.ValueType | undefined): void => {
        expect(3.0).assertEqual(ret as Number);
        done();
      })
    })


    /**
     * @tc.name   testPreferencesPutInt0100
     * @tc.number SUB_DistributedData_Preference_SDK_PutInt_strong_basis_EtsApiTest_0500
     * @tc.desc   PutInt promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesPutInt0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences!.clear();
      let val: long = 4;
      mPreferences!.put(KEY_TEST_INT_ELEMENT, val, (err: BusinessError | null) :void => {
        hilog.info(domain, tag, '%{public}s', TAG + "put end");
        await mPreferences!.flush(); // del
        hilog.info(domain, tag, '%{public}s', TAG + "flush end");
        let pre = await mPreferences!.get(KEY_TEST_INT_ELEMENT, 0);
        hilog.info(domain, tag, '%{public}s', TAG + "get end, value:" + pre);
        expect(val).assertEqual(pre);
        hilog.info(domain, tag, '%{public}s', TAG + "assertTrue success");
        await mPreferences!.flush();
        hilog.info(domain, tag, '%{public}s', TAG + "flush end");
        let pre2 = await mPreferences!.get(KEY_TEST_INT_ELEMENT, 0);
        hilog.info(domain, tag, '%{public}s', TAG + "get pre2 is:" + pre2);
        expect(val).assertEqual(pre2);
        hilog.info(domain, tag, '%{public}s', TAG + "assertTrue success");
        done();
      });
    })


    /**
     * @tc.name   testPreferencesDelete0010
     * @tc.number SUB_DistributedData_Preference_SDK_Delete_strong_basis_EtsApiTest_0600
     * @tc.desc   Delete promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesDelete0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences!.put(KEY_TEST_FLOAT_ELEMENT, 3.0);
      let ret = await mPreferences!.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
      expect(3.0).assertEqual(ret);

      await mPreferences!.flush();
      mPreferences!.delete(KEY_TEST_FLOAT_ELEMENT, (err: BusinessError | null) => {
        if (err && err.code != 0) {
          hilog.info(domain, tag, '%{public}s', "Failed to delete the key KEY_TEST_STRING_ELEMENT. err =" + err);
          expect(!err).assertTrue();
        }
        hilog.info(domain, tag, '%{public}s', "Succeeded in deleting the key KEY_TEST_STRING_ELEMENT.");
        let per = mPreferences!.getSync(KEY_TEST_FLOAT_ELEMENT, 0.0);
        expect(0.0).assertEqual(per);
        done();
      });
    });


    /**
     * @tc.name   testPreferencesHasKey0036
     * @tc.number SUB_DistributedData_Preference_SDK_HasKey_strong_basis_EtsApiTest_0700
     * @tc.desc   HasKey promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesHasKey0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences!.put(KEY_TEST_BOOLEAN_ELEMENT, false);
      mPreferences!.has(KEY_TEST_BOOLEAN_ELEMENT, (err: BusinessError | null, ret : Boolean | undefined) : void => {
        expect(true).assertEqual(ret);
        done();
      })
    })


    /**
     * @tc.name   testPreferencesHasKey0031
     * @tc.number SUB_DistributedData_Preference_SDK_HasKey_strong_basis_EtsApiTest_0800
     * @tc.desc   HasKey promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesHasKey0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences!.put(KEY_TEST_STRING_ELEMENT, "test");
      await mPreferences!.has(KEY_TEST_STRING_ELEMENT).then((ret : Object) : Promise<void> => {
        expect(true).assertEqual(ret);
        done();
      }).catch((err : Error) => {
        expect(null).assertFail();
        done();
      });
    })


    /**
     * @tc.name   testRemovePreferencesFromCache0001
     * @tc.number SUB_DistributedData_Preference_SDK_HasKey_strong_basis_EtsApiTest_0900
     * @tc.desc   HasKey promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRemovePreferencesFromCache0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      dataPreferences.getPreferences(context!, NAME, (err : BusinessError | null, preferences : dataPreferences.Preferences | undefined): void => {
        // if(err != null){
        if(err && err.code != 0){
          hilog.info(domain, tag, '%{public}s', TAG + "Get preferences err: " + err)
          expect(false).assertTrue();
        }else{
          hilog.info(domain, tag, '%{public}s', TAG + "Get preferences success")
          expect(preferences != null).assertTrue();
        }
      })
      dataPreferences.removePreferencesFromCache(context!, NAME, (err  : BusinessError | null) : void => {
        // if(err != null){
        if(err && err.code != 0){
          hilog.info(domain, tag, '%{public}s', TAG + "Remove preferences from cache error: " + err)
          expect(false).assertTrue();
        }else{
          hilog.info(domain, tag, '%{public}s', TAG + "Remove preferences from cache success")
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_DDM_Preferences_removePreferencesFromCacheSync_0400
     * @tc.number SUB_DistributedData_Preference_SDK_removePreferencesFromCacheSync_strong_basis_EtsApiTest_1000
     * @tc.desc   removePreferencesFromCacheSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_removePreferencesFromCacheSync_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 begin.");
      const Options: dataPreferences.Options = {
        name: "test_preferences_callback",
        // dataGroupId: '123456'
      };
      hilog.info(domain, tag, '%{public}s', "000000000000 .");
      try {
        mPreferences = dataPreferences.getPreferencesSync(context!, Options);
      } catch (err) {
        hilog.error(domain, tag, '%{public}s', "BusinessError: " + err.message);
      }
      mPreferences!.clearSync();
      mPreferences!.putSync(KEY_TEST_STRING_ELEMENT, 'test');
      mPreferences!.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");
      hilog.info(domain, tag, '%{public}s', "SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 123");
      mPreferences!.flush((err: BusinessError | null) => {
        hilog.info(domain, tag, '%{public}s', "SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 1234");
        if (err && err.code != 0) {
          hilog.info(domain, tag, '%{public}s', "flush err.");
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', "flush done.");
        dataPreferences.removePreferencesFromCacheSync(context!, Options);
        let value : dataPreferences.ValueType = mPreferences!.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");
        hilog.info(domain, tag, '%{public}s', "SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 end" + value);
        expect('test').assertEqual(value);
        done();
        hilog.info(domain, tag, '%{public}s', "SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 end");

      });
      hilog.info(domain, tag, '%{public}s', "SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 1235");

      done();
    })


    /**
     * @tc.name   SUB_DDM_Preferences_deleteSync_0100
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_strong_basis_EtsApiTest_1100
     * @tc.desc   deleteSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_deleteSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      mPreferences!.putSync(KEY_TEST_STRING_ELEMENT, "abc");
      expect("abc").assertEqual(mPreferences!.getSync(KEY_TEST_STRING_ELEMENT, "default"));
      mPreferences!.deleteSync(KEY_TEST_STRING_ELEMENT);
      expect("default").assertEqual(mPreferences!.getSync(KEY_TEST_STRING_ELEMENT, "default"));
      done();
    })


    /**
     * @tc.name   SUB_DDM_Preferences_GetPreferencesSync_0100
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_sGetPreferencesSync_basis_EtsApiTest_1200
     * @tc.desc   GetPreferencesSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_GetPreferencesSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const Options : dataPreferences.Options = {
        name: "test_preferences_callback",
        dataGroupId: null
      };
      try {
        mPreferences = dataPreferences.getPreferencesSync(context!, Options);
        done();
      } catch (errInfo) {
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   PreferencesHasSync0100
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_HasSync_basis_EtsApiTest_1300
     * @tc.desc   HasSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PreferencesHasSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      mPreferences!.clearSync();
      mPreferences!.putSync(KEY_TEST_STRING_ELEMENT, "test");
      const ret = mPreferences!.hasSync(KEY_TEST_STRING_ELEMENT);
      expect(true).assertEqual(ret);
      done();
    });


    /**
     * @tc.name   SUB_DDM_Preferences_GetAllSync_0100
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAllSync_basis_EtsApiTest_1400
     * @tc.desc   GetAllSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_GetAllSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      mPreferences!.clearSync();
      const doubleArr = new Array<double>(11, 22, 33);
      const stringArr = new Array<string>('11', '22', '33');
      const boolArr = new Array<boolean>(true, false, false, true);
      mPreferences!.putSync(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
      mPreferences!.putSync(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
      mPreferences!.putSync(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
      mPreferences!.putSync(KEY_TEST_BOOLEAN_ELEMENT, false);
      mPreferences!.putSync(KEY_TEST_STRING_ELEMENT, "123");
      mPreferences!.putSync(KEY_TEST_FLOAT_ELEMENT, 123.1);

      await mPreferences!.flush();
      let obj = mPreferences!.getAllSync();
      let mapVals = obj as Record<string, dataPreferences.ValueType>;
      expect(false).assertEqual(mapVals.get(KEY_TEST_BOOLEAN_ELEMENT));
      expect("123").assertEqual(mapVals.get(KEY_TEST_STRING_ELEMENT));
      expect(123.1).assertEqual(mapVals.get(KEY_TEST_FLOAT_ELEMENT));

      let sArrObj = mapVals.get(KEY_TEST_STRING_ARRAY_ELEMENT);
      expect(sArrObj!=null).assertEqual(true);
      let sArr = sArrObj as Array<string>;
      for (let i = 0; i < sArr.length; i++) {
        expect(sArr[i]).assertEqual(stringArr[i]);
      }

      let bArrObj = mapVals.get(KEY_TEST_BOOL_ARRAY_ELEMENT);
      expect(bArrObj!=null).assertEqual(true);
      let bArr = bArrObj as Array<boolean>;
      for (let i = 0; i < bArr.length; i++) {
        expect(bArr[i]).assertEqual(boolArr[i]);
      }

      let nArrObj = mapVals.get(KEY_TEST_NUMBER_ARRAY_ELEMENT);
      expect(nArrObj!=null).assertEqual(true);
      let nArr = nArrObj as Array<number>;
      for (let i = 0; i < nArr.length; i++) {
        expect(nArr[i]).assertEqual(doubleArr[i]);
      }
      done();
    });


    /**
     * @tc.name   testPreferencesClear0012
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_Clear_basis_EtsApiTest_1500
     * @tc.desc   Clear promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesClear0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences!.put(KEY_TEST_STRING_ELEMENT, "test");
      await mPreferences!.flush();
      mPreferences!.clear((err : BusinessError | null) : void => {
        let pre = await mPreferences!.get(KEY_TEST_STRING_ELEMENT, "defaultvalue")
        expect("defaultvalue").assertEqual(pre);
        done();
      });
    });


    /**
     * @tc.name   testPreferencesClear0011
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_Clear_basis_EtsApiTest_1600
     * @tc.desc   Clear promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesClear0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences!.put(KEY_TEST_STRING_ELEMENT, "test");
      await mPreferences!.flush();
      await mPreferences!.clear().then(() : void => {
        let per = await mPreferences!.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
        expect("defaultvalue").assertEqual(per);
        done();
      }).catch((err) => {
        expect(null).assertFail();
        done();
      });
    });


    /**
     * @tc.name   testPreferencesDeletePreferences0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_DeletePreferences_basis_EtsApiTest_1700
     * @tc.desc   DeletePreferences promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesDeletePreferences0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const NAME = 'getPreferencesTest'
      dataPreferences.getPreferences(context!, NAME, (err : BusinessError | null, preferences : dataPreferences.Preferences | undefined) : void => {
        // if(err != null){
        if(err && err.code != 0){
          hilog.info(domain, tag, '%{public}s', TAG + "Get preferences err: " + err)
          expect(false).assertTrue();
        }else{
          hilog.info(domain, tag, '%{public}s', TAG + "Get preferences success")
          expect(preferences != null).assertTrue();
        }
      })
      dataPreferences.deletePreferences(context!, NAME, (err : BusinessError | null) : void => {
        if(err && err.code != 0){
          hilog.info(domain, tag, '%{public}s', TAG + "Delete preferences err: " + err)
          expect(false).assertTrue();
        }else{
          hilog.info(domain, tag, '%{public}s', TAG + "Delete preferences success")
        }
      })
      done()
    });


    /**
     * @tc.name   testPreferencesGetPreferencesPromise0010
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetPreferences_basis_EtsApiTest_1800
     * @tc.desc   GetPreferences promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetPreferencesPromise0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      dataPreferences.getPreferences(context!, NAME1).then(async (preferences : dataPreferences.Preferences) => {
        hilog.info(domain, tag, '%{public}s', TAG + "Get preferences success" + preferences);
        await preferences.put(KEY_TEST_STRING_ELEMENT, "test");
        preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err: BusinessError | null, ret: dataPreferences.ValueType | undefined) => {
          expect("test").assertEqual(ret);
        });
        await dataPreferences.deletePreferences(context!, NAME1).then<void, void>((): void => {});
        done();
      }).catch((err: Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "Get preferences err: " + err);
        expect(!err).assertTrue();
      })
    });


    /**
     * @tc.name   PreferencesRemovePreferencesFromCacheSync0100
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_RemovePreferencesFromCacheSync_basis_EtsApiTest_1900
     * @tc.desc   RemovePreferencesFromCacheSync promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PreferencesRemovePreferencesFromCacheSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log("PreferencesRemovePreferencesFromCacheSync0100 begin.");
      mPreferences = await dataPreferences.getPreferences(context!, NAME);
      mPreferences!.clearSync();
      mPreferences!.putSync(KEY_TEST_STRING_ELEMENT, 'test')
      mPreferences!.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue")
      mPreferences!.flush((err: BusinessError |null): void => {
        if (err && err.code != 0) {
          console.log("flush err.");
          expect().assertFail();
        }
        console.log("flush done.");
        dataPreferences.removePreferencesFromCacheSync(context!, NAME);
        let value = mPreferences!.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue")
        console.log("PreferencesRemovePreferencesFromCacheSync0100 end." + value);
        expect('test').assertEqual(value);
        done();
        console.log("PreferencesRemovePreferencesFromCacheSync0100 end.");
      });
      done();
    });

    
    /**
     * @tc.name   testPreferencesGetAllCallBackTest0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_2000
     * @tc.desc   GetAll promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testPreferencesGetAllCallBackTest0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences!.clear();
      let doubleArr = new Array<number>(11, 22, 33);
      let stringArr = new Array<string>('11', '22', '33');
      let boolArr = new Array<boolean>(true, false, false, true);
      await mPreferences!.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
      await mPreferences!.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
      await mPreferences!.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
      await mPreferences!.put(KEY_TEST_BOOLEAN_ELEMENT, false);
      await mPreferences!.put(KEY_TEST_STRING_ELEMENT, "123");
      await mPreferences!.put(KEY_TEST_FLOAT_ELEMENT, 123.1);

      await mPreferences!.flush();

      mPreferences!.getAll((err: BusinessError | null, value: Object | undefined) => {
        let obj = value as Record<string, object>;
        expect(false).assertEqual(obj.get(KEY_TEST_BOOLEAN_ELEMENT));
        expect("123").assertEqual(obj.get(KEY_TEST_STRING_ELEMENT));
        expect(123.1).assertEqual(obj.get(KEY_TEST_FLOAT_ELEMENT));

        let sArrObj = obj.get(KEY_TEST_STRING_ARRAY_ELEMENT);
        expect(sArrObj!=null).assertEqual(true);
        let sArr = sArrObj as Array<string>;
        for (let i = 0; i < sArr.length; i++) {
          expect(sArr[i]).assertEqual(stringArr[i]);
        }

        let bArrObj = obj.get(KEY_TEST_BOOL_ARRAY_ELEMENT);
        expect(bArrObj!=null).assertEqual(true);
        let bArr = bArrObj as Array<boolean>;
        for (let i = 0; i < bArr.length; i++) {
          expect(bArr[i]).assertEqual(boolArr[i]);
        }

        let nArrObj = obj.get(KEY_TEST_NUMBER_ARRAY_ELEMENT);
        expect(nArrObj!=null).assertEqual(true);
        let nArr = nArrObj as Array<number>;
        for (let i = 0; i < nArr.length; i++) {
          expect(nArr[i]).assertEqual(doubleArr[i]);
        }

        done();
      });
    });


    /**
     * @tc.name   testPreferencesGetAllPromiseTest0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_2100
     * @tc.desc   GetAllPromise promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesGetAllPromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences!.clear();
      let doubleArr = new Array<number>(11, 22, 33);
      let stringArr = new Array<string>('11', '22', '33');
      let boolArr = new Array<boolean>(true, false, false, true);
      await mPreferences!.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
      await mPreferences!.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
      await mPreferences!.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
      await mPreferences!.put(KEY_TEST_BOOLEAN_ELEMENT, false);
      await mPreferences!.put(KEY_TEST_STRING_ELEMENT, "123");
      await mPreferences!.put(KEY_TEST_FLOAT_ELEMENT, 123.1);

      await mPreferences!.flush();

      await mPreferences!.getAll().then((value: Object) => {
        let obj = value as Record<string, object>;
        expect(false).assertEqual(obj.get(KEY_TEST_BOOLEAN_ELEMENT));
        expect("123").assertEqual(obj.get(KEY_TEST_STRING_ELEMENT));
        expect(123.1).assertEqual(obj.get(KEY_TEST_FLOAT_ELEMENT));

        let sArrObj = obj.get(KEY_TEST_STRING_ARRAY_ELEMENT);
        expect(sArrObj!=null).assertEqual(true);
        let sArr = sArrObj as Array<string>;
        for (let i = 0; i < sArr.length; i++) {
          expect(sArr[i]).assertEqual(stringArr[i]);
        }

        let bArrObj = obj.get(KEY_TEST_BOOL_ARRAY_ELEMENT);
        expect(bArrObj!=null).assertEqual(true);
        let bArr = bArrObj as Array<boolean>;
        for (let i = 0; i < bArr.length; i++) {
          expect(bArr[i]).assertEqual(boolArr[i]);
        }

        let nArrObj = obj.get(KEY_TEST_NUMBER_ARRAY_ELEMENT);
        expect(nArrObj!=null).assertEqual(true);
        let nArr = nArrObj as Array<number>;
        for (let i = 0; i < nArr.length; i++) {
          expect(nArr[i]).assertEqual(doubleArr[i]);
        }
        done();
      }).catch((err: Error) => {
        expect(null).assertFail();
        done();
      })
    })


    /**
     * @tc.name   testPreferencesOnChangePromiseTest0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_2600
     * @tc.desc   GetAllPromise promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesOnChangePromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnChangePromiseTest0001 start");
      try {
        await mPreferences!.clear();
        await mPreferences!.flush();
        const testObserver = (key : string): void => {
          hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnChangePromiseTest0001 key:" + key);
          expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
        }
        mPreferences!.onChange(testObserver);
        hilog.info(domain, tag, '%{public}s', TAG + "start on2");
        mPreferences!.onChange(testObserver);
        hilog.info(domain, tag, '%{public}s', TAG + "start put");

        await mPreferences!.put(KEY_TEST_STRING_ELEMENT, "abc");
        hilog.info(domain, tag, '%{public}s', TAG + "start flush");

        await mPreferences!.flush();
        hilog.info(domain, tag, '%{public}s', TAG + "start sleep");

        await Utils.msSleep(1000);
        mPreferences!.offChange(testObserver);
      } catch (err) {
        expect().assertFail();
      } finally {
        done();
      }
    })


    /**
     * @tc.name   testPreferencesOffChangePromiseTest0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_2700
     * @tc.desc   GetAllPromise promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesOffChangePromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOffChangePromiseTest0001 start");
      try {
        await mPreferences!.clear();
        await mPreferences!.flush();
        const testObserver = (key : string): void => {
          hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOffChangePromiseTest0001 key:" + key);
          expect(null).assertFail();
        }
        mPreferences!.onChange(testObserver);
        mPreferences!.offChange(testObserver);
        await mPreferences!.put(KEY_TEST_STRING_ELEMENT, "abc");
        await mPreferences!.flush();
        await Utils.msSleep(1000);
      } catch (err) {
        expect().assertFail();
      } finally {
        done();
      }
    })


    /**
     * @tc.name   testPreferencesOnMultiprocessPromiseTest0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_2800
     * @tc.desc   GetAllPromise promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesOnMultiprocessPromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnMultiprocessPromiseTest0001 start");
      try {
        await mPreferences!.clear();
        mPreferences!.flushSync();
        const testObserver = (key : string): void => {
          hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnMultiprocessPromiseTest0001 key:" + key);
          expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
        }
        mPreferences!.onMultiProcessChange(testObserver);
        mPreferences!.onMultiProcessChange(testObserver);
        await mPreferences!.put(KEY_TEST_STRING_ELEMENT, "abc");
        mPreferences!.flushSync();

        await Utils.msSleep(100);
        mPreferences!.offMultiProcessChange(testObserver);
      } catch (err) {
        expect().assertFail();
      } finally {
        done();
      }
    })


    /**
     * @tc.name   testPreferencesOffMultiprocessPromiseTest0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_2900
     * @tc.desc   GetAllPromise promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesOffMultiprocessPromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOffMultiprocessPromiseTest0001 start");
      try {
        await mPreferences!.clear();
        mPreferences!.flushSync();
        const testObserver = (key : string): void => {
          hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOffMultiprocessPromiseTest0001 key:" + key);
          expect(null).assertFail();
        }
        mPreferences!.onMultiProcessChange(testObserver);
        mPreferences!.offMultiProcessChange(testObserver);
        await mPreferences!.put(KEY_TEST_STRING_ELEMENT, "abc");
        mPreferences!.flushSync();
        await Utils.msSleep(1000);
      } catch (err) {
        expect().assertFail();
      } finally {
        done();
      }
    })


    /**
     * @tc.name   testPreferencesOnDatachangePromiseTest0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_3000
     * @tc.desc   GetAllPromise promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesOnDatachangePromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnDatachangePromiseTest0001 start");
      try {
        await mPreferences!.clear();
        mPreferences!.flushSync();
        const testObserver = (obj: Record<string, dataPreferences.ValueType>): void => {
          hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnDatachangePromiseTest0001 value:" + obj.get(KEY_TEST_STRING_ELEMENT));
          expect("abc").assertEqual(obj.get(KEY_TEST_STRING_ELEMENT));
        }
        let keys = new Array<string>(KEY_TEST_STRING_ELEMENT);
        mPreferences!.onDataChange(keys, testObserver);
        mPreferences!.onDataChange(keys, testObserver);
        await mPreferences!.put(KEY_TEST_STRING_ELEMENT, "abc");
        mPreferences!.flushSync();
        await Utils.msSleep(100);
        mPreferences!.offDataChange(keys, testObserver);
      } catch (err) {
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.name   testPreferencesOnMultiprocessErrPromiseTest0001
     * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_3100
     * @tc.desc   GetAllPromise promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesOnMultiprocessErrPromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnMultiprocessErrPromiseTest0001 start");
      try {
        await mPreferences!.clear();
        mPreferences!.flushSync();
        const testObserver = (key : string): void => {
          hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnMultiprocessErrPromiseTest0001 key:" + key);
          expect(null).assertFail();
        }
        for (let index = 0; index < 80; index++) {
          mPreferences!.onMultiProcessChange(testObserver);
          mPreferences!.offMultiProcessChange(testObserver);
        }
        await mPreferences!.put(KEY_TEST_STRING_ELEMENT, "abc");
        mPreferences!.flushSync();
        await Utils.msSleep(1000);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesOnMultiprocessErrPromiseTest0001 :" + err.code + err.message );
        expect(err.code).assertEqual(15500019);
      } finally {
        done();
      }
    })


    /**
     * @tc.name   testPreferencesMxaKeyLengthPromiseTest0001
     * @tc.number SUB_DistributedData_Preference_SDK_MxaKeyLength_basis_EtsApiTest_3200
     * @tc.desc   MxaKeyLength promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesMxaKeyLengthPromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try{
        await mPreferences!.clear();
        await mPreferences!.put(MAX_KEY_LENGTH, "abc");
        let ret = await mPreferences!.get(MAX_KEY_LENGTH, "default");
        expect("abc").assertEqual(ret);
        done();
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesMxaKeyLengthPromiseTest0001 :" + err.code + err.message );
        expect().assertFail();
        done();
      }
    })

    const userArrVar: User[] = [];
    userArrVar.push({ name: 'zhangSan', age: 18, salary: 3000.5 });
    userArrVar.push({ name: 'lisi', age: 20, salary: 5000.4 });
    const moneyNum = BigInt("-12345678912345678912345678971234567123456");
    let company: Company = {
      cName: '我的公司',
      enName: 'myCompany',
      year: 1998,
      groups: ['dp1', 'dp2'],
      users: userArrVar,
      isActive: true,
      money: moneyNum
    };

    /**
     * @tc.name   testPreferencesObjectPromiseTestGet
     * @tc.number SUB_DistributedData_Preference_SDK_ObjectGet_basis_EtsApiTest_3300
     * @tc.desc   MxaKeyLength promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesObjectPromiseTestGet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await mPreferences!.clear();
        mPreferences!.flushSync();

        await mPreferences!.put("object_key", company);
        let compJson = await mPreferences!.get("object_key", {});
        let opt =  {bigIntMode: jsonx.BigIntMode.PARSE_AS_BIGINT} as jsonx.ParseOptions;
        let compJsonElement = JSON.parseJsonElement(compJson!.toString(), opt);
        expect("我的公司").assertEqual(compJsonElement.getElement("cName").asString());
        expect("myCompany").assertEqual(compJsonElement.getElement("enName").asString());
        expect(1998).assertEqual(compJsonElement.getElement("year").asInteger());
        expect(true).assertEqual(compJsonElement.getElement("isActive").asBoolean());

        let groups = compJsonElement.getArray("groups");
        expect("dp1").assertEqual(groups[0].asString());
        expect("dp2").assertEqual(groups[1].asString());
        let users = compJsonElement.getArray("users");
        expect(18).assertEqual(users[0].getElement("age").asInteger());
        expect("zhangSan").assertEqual(users[0].getElement("name").asString());
        expect(3000.5).assertEqual(users[0].getElement("salary").asDouble());
        expect(20).assertEqual(users[1].getElement("age").asInteger());
        expect("lisi").assertEqual(users[1].getElement("name").asString());
        expect(5000.4).assertEqual(users[1].getElement("salary").asDouble());
        done();
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesObjectPromiseTestGet :" + err.code + err.message );
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testPreferencesObjectPromiseTestGetAll
     * @tc.number SUB_DistributedData_Preference_SDK_ObjectGetAll_basis_EtsApiTest_3400
     * @tc.desc   MxaKeyLength promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesObjectPromiseTestGetAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await mPreferences!.clear();
        mPreferences!.flushSync();

        await mPreferences!.put("object_key", company);
        await mPreferences!.put("string_key", 'test_string');
        await mPreferences!.put("double_key", 3.14);

        mPreferences!.getAll((err: BusinessError | null, value: Object | undefined) => {
          let obj = value as Record<string, object>;
          expect("test_string").assertEqual(obj.get("string_key"));
          expect(3.14).assertEqual(obj.get("double_key"));
          let allJson = obj.get("object_key");
          let compJsonElement = JSON.parseJsonElement(allJson?.toString() as string);

          expect("我的公司").assertEqual(compJsonElement.getElement("cName").asString());
          expect("myCompany").assertEqual(compJsonElement.getElement("enName").asString());
          expect(1998).assertEqual(compJsonElement.getElement("year").asInteger());
          expect(true).assertEqual(compJsonElement.getElement("isActive").asBoolean());

          let groups = compJsonElement.getArray("groups");
          expect("dp1").assertEqual(groups[0].asString());
          expect("dp2").assertEqual(groups[1].asString());
          let users = compJsonElement.getArray("users");
          expect(18).assertEqual(users[0].getElement("age").asInteger());
          expect("zhangSan").assertEqual(users[0].getElement("name").asString());
          expect(3000.5).assertEqual(users[0].getElement("salary").asDouble());
          expect(20).assertEqual(users[1].getElement("age").asInteger());
          expect("lisi").assertEqual(users[1].getElement("name").asString());
          expect(5000.4).assertEqual(users[1].getElement("salary").asDouble());
          done();
        })
        done();
      } catch(err) {
        hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesObjectPromiseTestGetAll :" + err.code + err.message );
        expect().assertFail();
        done();
      }
    })

    /**
     * @generated.time 2025-11-27 20:49:48
     * @tc.name   PreferencesBaseDataType001
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesBaseDataType001_basis_EtsApiTest_3500
     * @tc.desc   Preferences Base DataType test int
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PreferencesBaseDataType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let preferences = await dataPreferences.getPreferences(context!, 'test_preferences_base_int');
      let baseInt: long = 123;
      await preferences.put('base_int', baseInt);
      await preferences.flush();
      let ret = preferences.getSync("base_int", 0);
      expect(baseInt).assertEqual(ret);
      hilog.info(domain, tag, '%{public}s', TAG + "PreferencesBaseDataType001 key base_int, ret instanceof int:" + (ret instanceof long));
      expect(true).assertEqual(ret instanceof long);
      await dataPreferences.deletePreferences(context!, 'test_preferences_base_int');
      done();
    })

    /**
     * @generated.time 2025-11-27 20:49:48
     * @tc.name   PreferencesBaseDataType002
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesBaseDataType002_basis_EtsApiTest_3600
     * @tc.desc   Preferences Base DataType test number/double
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PreferencesBaseDataType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let preferences = await dataPreferences.getPreferences(context!, 'test_preferences_base_double');
      let baseDouble: double = 1239999999.1;
      await preferences.put('base_double', baseDouble);
      await preferences.flush();
      let ret = preferences.getSync("base_double", 0.0);
      expect(baseDouble).assertEqual(ret);
      hilog.info(domain, tag, '%{public}s', TAG + "PreferencesBaseDataType002 key base_double, typeof(ret):" + typeof(ret));
      expect(typeof(ret)).assertEqual("number");
      let numberData: number = 777;
      expect(true).assertEqual(typeof(ret) == typeof(numberData));
      expect(true).assertEqual(typeof(ret) == typeof(baseDouble));
      expect(true).assertEqual(typeof(numberData) == typeof(baseDouble));
      await dataPreferences.deletePreferences(context!, 'test_preferences_base_double');
      done();
    })

    /**
     * @generated.time 2025-11-27 20:49:48
     * @tc.name   PreferencesBaseDataType003
     * @tc.number SUB_DistributedData_Preference_SDK_PreferencesBaseDataType003_basis_EtsApiTest_3700
     * @tc.desc   Preferences Base DataType test long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PreferencesBaseDataType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let preferences = await dataPreferences.getPreferences(context!, 'test_preferences_base_long');
      let baseLong: long = 123888888888;
      await preferences.put('base_long', baseLong);
      await preferences.flush();
      let ret = preferences.getSync("base_long", 0);
      expect(baseLong).assertEqual(ret);
      hilog.info(domain, tag, '%{public}s', TAG + "PreferencesBaseDataType003 key base_long, (ret instanceof long):" + (ret instanceof long));
      expect(true).assertEqual(ret instanceof long);
      await dataPreferences.deletePreferences(context!, 'test_preferences_base_long');
      done();
    })

    /**
     * @tc.name   testPreferencesPutFlushRemoveGet_0100
     * @tc.number SUB_DistributedData_Preference_SDK_testPreferencesPutFlushRemoveGet0100_basis_EtsApiTest_3800
     * @tc.desc   put get flush removePreferencesFromCache get promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesPutFlushRemoveGet_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "start_test_0100");
      await mPreferences!.clear();
      await mPreferences!.flush();
      let val: long = 1;
      await mPreferences!.put(KEY_TEST_LONG_ELEMENT, val).then(() : Promise<void> => {
        hilog.info(domain, tag, '%{public}s', TAG + "put succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "put failed error message = " + err);
      })

      await mPreferences!.get(KEY_TEST_LONG_ELEMENT, val).then((res1 : dataPreferences.ValueType) :  Promise<void> => {
        expect(val).assertEqual(res1 as Long);
        hilog.info(domain, tag, '%{public}s', TAG + "res1 = " + res1 + "get res1 succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "get res1 failed error message = " + err);
      })

      await mPreferences!.flush().then(() => {
        hilog.info(domain, tag, '%{public}s', TAG + "flush succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "flush failed error message = " + err);
      })

      await dataPreferences.removePreferencesFromCache(context!, NAME).then(() :  Promise<void> => {
        hilog.info(domain, tag, '%{public}s', TAG + "remove succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "remove failed error message = " + err);
      })

      mPreferences = await dataPreferences.getPreferences(context!, NAME);

      await mPreferences!.get(KEY_TEST_LONG_ELEMENT, val).then((res2 : dataPreferences.ValueType) :  Promise<void> => {
        expect(val).assertEqual(res2 as Long);
        hilog.info(domain, tag, '%{public}s', TAG + "res2 = " + res2 + "get res2 succeed. test0300end");
        done();
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "get res2 failed error message = " + err);
      })
      done();
    })

    /**
     * @tc.name   testPreferencesPutFlushRemoveGet_0200
     * @tc.number SUB_DistributedData_Preference_SDK_testPreferencesPutFlushRemoveGet0200_basis_EtsApiTest_3900
     * @tc.desc   put get flush removePreferencesFromCache get promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesPutFlushRemoveGet_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "start_test_0200");
      await mPreferences!.clear();
      await mPreferences!.flush();
      let val: double = 111.1;

      await mPreferences!.put(KEY_TEST_FLOAT_ELEMENT, val).then(async () : Promise<void> => {
        hilog.info(domain, tag, '%{public}s', TAG + "put succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "put failed error message = " + err);
      })

      await mPreferences!.get(KEY_TEST_FLOAT_ELEMENT, val).then((res1 : dataPreferences.ValueType) :  Promise<void> => {
        expect(val).assertEqual(res1 as Double);
        hilog.info(domain, tag, '%{public}s', TAG + "res1 = " + res1 + "get res1 succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "get res1 failed error message = " + err);
      })

      await mPreferences!.flush().then(() => {
        hilog.info(domain, tag, '%{public}s', TAG + "flush succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "flush failed error message = " + err);
      })

      await dataPreferences.removePreferencesFromCache(context!, NAME).then(() :  Promise<void> => {
        hilog.info(domain, tag, '%{public}s', TAG + "remove succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "remove failed error message = " + err);
      })

      mPreferences = await dataPreferences.getPreferences(context!, NAME);

      await mPreferences!.get(KEY_TEST_FLOAT_ELEMENT, val).then((res2 : dataPreferences.ValueType) :  Promise<void> => {
        expect(val).assertEqual(res2 as Double);
        hilog.info(domain, tag, '%{public}s', TAG + "res2 = " + res2 + "get res2 succeed. test0300end");
        done();
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "get res2 failed error message = " + err);
      })
      done();
    })

    /**
     * @tc.name   testPreferencesPutFlushRemoveGet_0500
     * @tc.number SUB_DistributedData_Preference_SDK_testPreferencesPutFlushRemoveGet0500_basis_EtsApiTest_4000
     * @tc.desc   put get flush removePreferencesFromCache get promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesPutFlushRemoveGet_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "start_test_0300");
      await mPreferences!.clear();
      let val: boolean = true;
      await mPreferences!.put(KEY_TEST_BOOLEAN_ELEMENT, val).then(async () : Promise<void> => {
        hilog.info(domain, tag, '%{public}s', TAG + "put succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "put failed error message = " + err);
      })

      await mPreferences!.get(KEY_TEST_BOOLEAN_ELEMENT, val).then((res1 : dataPreferences.ValueType) :  Promise<void> => {
        expect(val).assertEqual(res1);
        hilog.info(domain, tag, '%{public}s', TAG + "res1 = " + res1 + "get res1 succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "get res1 failed error message = " + err);
      })

      await mPreferences!.flush().then(() => {
        hilog.info(domain, tag, '%{public}s', TAG + "flush succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "flush failed error message = " + err);
      })

      await dataPreferences.removePreferencesFromCache(context!, NAME).then(() :  Promise<void> => {
        hilog.info(domain, tag, '%{public}s', TAG + "remove succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "remove failed error message = " + err);
      })

      mPreferences = await dataPreferences.getPreferences(context!, NAME);

      await mPreferences!.get(KEY_TEST_BOOLEAN_ELEMENT, val).then((res2 : dataPreferences.ValueType) :  Promise<void> => {
        expect(val).assertEqual(res2);
        hilog.info(domain, tag, '%{public}s', TAG + "res2 = " + res2 + "get res2 succeed. test0300end");
        done();
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "get res2 failed error message = " + err);
      })
    })

    /**
     * @tc.name   testPreferencesPutFlushRemoveGet_0400
     * @tc.number SUB_DistributedData_Preference_SDK_testPreferencesPutFlushRemoveGet0400_basis_EtsApiTest_4100
     * @tc.desc   put get flush removePreferencesFromCacheget get promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesPutFlushRemoveGet_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log(TAG + "start_test_0400");
      await mPreferences!.clear();
      let val: string = "abc";
      await mPreferences!.put(KEY_TEST_STRING_ELEMENT, val).then(async () : Promise<void> => {
        hilog.info(domain, tag, '%{public}s', TAG + "put succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "put failed error message = " + err);
      })

      await mPreferences!.get(KEY_TEST_STRING_ELEMENT, val).then((res1 : dataPreferences.ValueType) :  Promise<void> => {
        expect(val).assertEqual(res1);
        hilog.info(domain, tag, '%{public}s', TAG + "res1 = " + res1 + "get res1 succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "get res1 failed error message = " + err);
      })

      await mPreferences!.flush().then(() => {
        hilog.info(domain, tag, '%{public}s', TAG + "flush succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "flush failed error message = " + err);
      })

      await dataPreferences.removePreferencesFromCache(context!, NAME).then(() :  Promise<void> => {
        hilog.info(domain, tag, '%{public}s', TAG + "remove succeed");
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "remove failed error message = " + err);
      })

      mPreferences = await dataPreferences.getPreferences(context!, NAME);

      await mPreferences!.get(KEY_TEST_STRING_ELEMENT, val).then((res2 : dataPreferences.ValueType) :  Promise<void> => {
        expect(val).assertEqual(res2);
        hilog.info(domain, tag, '%{public}s', TAG + "res2 = " + res2 + "get res2 succeed. test0300end");
        done();
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', TAG + "get res2 failed error message = " + err);
      })
    })

    /**
     * @tc.name   testPreferenceClearErrTest0100
     * @tc.number SUB_DistributedData_Preference_SDK_testPreferenceClearErrTest0100_basis_EtsApiTest_4200
     * @tc.desc   mPreference.clear()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferenceClearErrTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences!.clear();
      await mPreferences!.flush();
      console.log("testPreferenceClearErrTest0100 begin.");
      try {
        mPreferences!.clear((err : BusinessError | null) : void => {
          if (err) {
            console.log();
            hilog.info(domain, tag, '%{public}s', "clear err =" + err + ", code =" + err.code + ", message =" + err.message)
            expect(401).assertEqual(err.code);
            expect(false).assertTrue();
            done();
          }
          hilog.info(domain, tag, '%{public}s', "testPreferenceClearErrTest0100 end");
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', "trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
      }
      done()
    })
    /**
     * @tc.name   testPreferenceOnErrTest0100
     * @tc.number SUB_DistributedData_Preference_SDK_testPreferenceOnErrTest0100_basis_EtsApiTest_4300
     * @tc.desc   mPreference.onMultiProcessChange() interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferenceOnErrTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences!.clear();
      await mPreferences!.flush();
      let observer = (key: string) => {
        hilog.info(domain, tag, '%{public}s', 'testPreferenceOnErrTest0100 keyValue' + mPreferences!.getSync(KEY_TEST_STRING_ELEMENT, "aaa"));
        done();
        expect('abc').assertEqual(mPreferences!.getSync(KEY_TEST_STRING_ELEMENT, "aaa"));
        mPreferences!.offMultiProcessChange();
      };
      try {
        let func = (p1: String) => {};
        mPreferences!.onMultiProcessChange(func);
        mPreferences!.putSync(KEY_TEST_STRING_ELEMENT, 'abc');
        await mPreferences!.flush();
        await Utils.msSleep(100);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', "clear err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect('401').assertEqual(err.code);
      } finally {
        done();
      }
    });

    /**
     * @tc.name   testGetPreferencesHelper001
     * @tc.number SUB_DistributedData_Preference_SDK_testGetPreferencesHelper001_basis_EtsApiTest_4400
     * @tc.desc   getPreferencesSync interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetPreferencesHelper001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      mPreferences = await dataPreferences.getPreferences(context!, NAME);
      let val: long = 2;
      await mPreferences!.put('test', val);
      await mPreferences!.flush();
      let value = await mPreferences!.get('test', 0);
      expect(value).assertEqual(val);
      done();
    });
    /**
     * @tc.name   testGetPreferencesHelper002
     * @tc.number SUB_DistributedData_Preference_SDK_testGetPreferencesHelper002_basis_EtsApiTest_4500
     * @tc.desc   getPreferences interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetPreferencesHelper002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const promise = dataPreferences.getPreferences(context!, NAME);
      await promise.then(async (pref : dataPreferences.Preferences) :  Promise<void> => {
        let val: long = 2;
        await pref.put('test', val);
        await pref.flush();
        let value = await mPreferences!.get('test', 0);
        expect(value).assertEqual(val);
        done();
      }).catch((err: Object|null|undefined) => {
        expect(null).assertFail();
      });
      done();
    });
    /**
     * @tc.name   testRemovePreferencesFromCache001
     * @tc.number SUB_DistributedData_Preference_SDK_testRemovePreferencesFromCache001_basis_EtsApiTest_4600
     * @tc.desc   removePreferencesFromCache interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRemovePreferencesFromCache001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let perf: dataPreferences.Preferences | null = await dataPreferences.getPreferences(context!, NAME);
      perf = null;
      const promise = dataPreferences.removePreferencesFromCache(context!, NAME);
      await promise.then(() :  Promise<void> => {
        hilog.info(domain, tag, '%{public}s', `removePreferencesFromCache successfully.`);
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', "removePreferencesFromCache err =" + err);
        expect(null).assertFail();
      });
      done();
    });
    /**
     * @tc.name   testDeletePreferencesHelper002
     * @tc.number SUB_DistributedData_Preference_SDK_testDeletePreferencesHelper002_basis_EtsApiTest_4700
     * @tc.desc   deletePreferences interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeletePreferencesHelper002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let perf: dataPreferences.Preferences | null = await dataPreferences.getPreferences(context!, NAME);
      perf = null;
      const promise = dataPreferences.deletePreferences(context!, NAME);
      await promise.then(() :  Promise<void> => {
        hilog.info(domain, tag, '%{public}s', `deletePreferences successfully.`);
      }).catch((err : Error) => {
        hilog.info(domain, tag, '%{public}s', "deletePreferences err " + err);
        expect(null).assertFail();
      });
      done();
    });
    /**
     * @tc.name   testPreferencesRegisterObserver001
     * @tc.number SUB_DistributedData_Preference_SDK_testPreferencesRegisterObserver001_basis_EtsApiTest_4800
     * @tc.desc   put interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesRegisterObserver001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', TAG + "testPreferencesRegisterObserver001 start");
      try {
        await mPreferences!.clear();
        await mPreferences!.flush();
        const testObserver = (key : string): void => {
          hilog.info(domain, tag, '%{public}s', `Register001.`);
          expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
        }
        mPreferences!.onChange(testObserver);
        hilog.info(domain, tag, '%{public}s', TAG + "start on2");

        await mPreferences!.put(KEY_TEST_STRING_ELEMENT, "abc");
        hilog.info(domain, tag, '%{public}s', TAG + "start flush");

        await mPreferences!.flush();
        hilog.info(domain, tag, '%{public}s', TAG + "start sleep");

        await Utils.msSleep(100);
        mPreferences!.offChange(testObserver);
      } catch (err) {
        expect().assertFail();
      } finally {
        done();
      }
    })
    /**
     * @tc.name   testPreferencesRegisterObserver002
     * @tc.number SUB_DistributedData_Preference_SDK_testPreferencesRegisterObserver002_basis_EtsApiTest_4900
     * @tc.desc   repeat on interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesRegisterObserver002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      await mPreferences!.clear();
      await mPreferences!.flush();
      const observer = (key : string): void => {
        hilog.info(domain, tag, '%{public}s', `Register002.`);
        expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
      };
      mPreferences!.onChange(observer);
      mPreferences!.onChange(observer);
      await mPreferences!.put(KEY_TEST_STRING_ELEMENT, "abc");
      await mPreferences!.flush();
      hilog.info(domain, tag, '%{public}s', `Register002. flush sync`);

      await Utils.msSleep(100);
      mPreferences!.offChange(observer);
      done();
    });
    /**
     * @tc.name   testPreferencesUnRegisterObserver001
     * @tc.number SUB_DistributedData_Preference_SDK_testPreferencesUnRegisterObserver001_basis_EtsApiTest_5000
     * @tc.desc   off interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesUnRegisterObserver001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const observer = (key : string): void => {
        hilog.info(domain, tag, '%{public}s', `UnRegister001.`);
        expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
      }
      mPreferences!.onChange(observer);
      await Utils.msSleep(100);
      await mPreferences!.put(KEY_TEST_STRING_ELEMENT, "");
      await mPreferences!.flush();
      hilog.info(domain, tag, '%{public}s', `UnRegister001. flush sync`);

      await Utils.msSleep(100);
      mPreferences!.offChange(observer);
      done();
    });
    /**
     * @tc.name   testGetPreferencesSyncinterface001
     * @tc.number SUB_DistributedData_Preference_SDK_testGetPreferencesSyncinterface001_basis_EtsApiTest_5100
     * @tc.desc   getPreferencesSync interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetPreferencesSyncinterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      mPreferences = dataPreferences.getPreferencesSync(context!, {
        name: 'test_preferences_helper'
      });
      let val: long = 2;
      mPreferences!.putSync("test", val);
      mPreferences!.flushSync();
      let value = mPreferences!.getSync('test', 0);
      expect(value).assertEqual(val);
      done();
    });

    /**
     * @tc.name   testPreferencesPutStringArray0131
     * @tc.number SUB_DistributedData_Preference_SDK_testPreferencesPutStringArray0131_basis_EtsApiTest_5200
     * @tc.desc   put StringArray promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPreferencesPutStringArray0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await mPreferences!.clear();
        await mPreferences!.flush();
        const stringArr = new Array<string>('1', '2', '3');
        await mPreferences!.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
        await mPreferences!.get(KEY_TEST_STRING_ARRAY_ELEMENT, ['123', '321']).then((pre : dataPreferences.ValueType) :  Promise<void> => {
          let preTemp = pre as Array<string>;
          for (let i = 0; i < stringArr.length; i++) {
            expect(stringArr[i]).assertEqual(preTemp[i]);
          }
        }).catch((err) => {
          expect(null).assertFail();
        })
      } catch (err) {
        expect().assertFail();
      } finally {
        done();
      }
    });

    /**
     * @tc.name   testPreferencesPutNumberArray0132
     * @tc.number SUB_DistributedData_Preference_SDK_testPreferencesPutNumberArray0132_basis_EtsApiTest_5300
     * @tc.desc   put NumberArray promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPreferencesPutNumberArray0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await mPreferences!.clear();
        await mPreferences!.flush();
        let numberArr = new Array<double>(11.1, 22.2, 33.3, 44.4, 55.5);
        await mPreferences!.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, numberArr);
        let nArrObj = mPreferences!.getSync(KEY_TEST_NUMBER_ARRAY_ELEMENT, new Array<double>()) as Array<double>;
        expect(nArrObj != null).assertEqual(true);
        for (let i = 0; i < nArrObj.length; i++) {
          expect(nArrObj[i]).assertEqual(numberArr[i]);
        }
      } catch (err) {
        expect().assertFail();
      } finally {
        done();
      }
    });

    /**
     * @tc.name   testPreferencesPutLongArray0132
     * @tc.number SUB_DistributedData_Preference_SDK_testPreferencesPutLongArray0132_basis_EtsApiTest_5400
     * @tc.desc   put NumberArray promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPreferencesPutLongArray0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await mPreferences!.clear();
        await mPreferences!.flush();
        let longArr = new Array<long>(1111, 2222, 3333, 4444, 5555);
        await mPreferences!.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, longArr);
        let nArrObj = mPreferences!.getSync(KEY_TEST_NUMBER_ARRAY_ELEMENT, new Array<long>()) as Array<long>;
        expect(nArrObj != null).assertEqual(true);
        for (let i = 0; i < nArrObj.length; i++) {
          expect(nArrObj[i]).assertEqual(longArr[i]);
        }
      } catch (err) {
        expect().assertFail();
      } finally {
        done();
      }
    });

    /**
     * @tc.name   testPreferencesPutBoolArray0133
     * @tc.number SUB_DistributedData_Preference_SDK_testPreferencesPutNumberArray0132_basis_EtsApiTest_5500
     * @tc.desc   put BoolArray promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPreferencesPutBoolArray0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await mPreferences!.clear();
        await mPreferences!.flush();
        let boolArr = new Array<boolean>(true, false, false, true);
        await mPreferences!.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
        let nArrObj = mPreferences!.getSync(KEY_TEST_BOOL_ARRAY_ELEMENT, new Array<boolean>()) as Array<boolean>;
        expect(nArrObj != null).assertEqual(true);
        for (let i = 0; i < nArrObj.length; i++) {
          expect(nArrObj[i]).assertEqual(boolArr[i]);
        }
      } catch (err) {
        expect().assertFail();
      } finally {
        done();
      }
    });
  })
}