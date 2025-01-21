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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import sendablePreferences from '@ohos.data.sendablePreferences';
import lang from '@arkts.lang';
import collections from '@arkts.collections';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


const options:sendablePreferences.Options= {name:'test_preferences'}
const KEY_NUMBER :string = 'key_test_int';
const KEY_LONG = 'key_test_long';
const value_long = 3.141592673;
const KEY_FLOAT = 'key_test_float';
const KEY_BOOLEAN = 'key_test_boolean';
const value_boolen = true
const KEY_STRING = 'key_test_string';
const value_string = '333';
const KEY_ARRAY_NUMBER= 'key_test_number_array';
const KEY_ARRAY_STRING = 'key_test_string_array';
const KEY_ARRAY_BOOL = 'key_test_bool_array';
const KEY_BIGINT = 'test_bigint';
const value_bigint = 4156329815655;
let mPreferences:sendablePreferences.Preferences;
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const TAG = ['testlog']

export default function sendablePreferencesPromiseTest() {
  describe('preferencesPromiseTest', () => {
    beforeAll(async () => {
      console.info('beforeAll');

    });
    afterAll(async () => {
      console.info('afterAll');
    });
    beforeEach(async () => {
      console.info('beforeEach');
      mPreferences = await sendablePreferences.getPreferences(context, options);
      await mPreferences.clear();
    });
    afterEach(async () => {
      console.info('afterEach');
      await sendablePreferences.removePreferencesFromCache(context, options)
      await sendablePreferences.deletePreferences(context, options);
    });

    /**
     * @tc.name testSendablePreferencesPutNumber0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_0100
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesPutNumber0100', 0, async (done: Function) => {
      try {
        await mPreferences.put(KEY_NUMBER, 333);
        let data = await mPreferences.get(KEY_NUMBER, 'default');
        expect(data === 333).assertTrue();
        console.info(TAG + 'succeed in getting');
      } catch (err) {
        console.info(TAG + "trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name testSendablePreferencesPutString0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_0200
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesPutString0100', 0, async (done: Function) => {
      await mPreferences.put(KEY_STRING, value_string);
      await mPreferences.get(KEY_STRING, 'default').then((data: lang.ISendable) => {
        console.info(TAG + `Succeeded in getting value of KEY_STRING. Data: ${data}`);
        expect(data === value_string).assertTrue()
      }).catch((err: BusinessError) => {
        console.error(TAG + `Failed to get value of KEY_STRING. code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      })
      done();
    });

    /**
     * @tc.name testSendablePreferencesPutBool0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_0300
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testSendablePreferencesPutBool0100', 0, async (done: Function) => {
      await mPreferences.put(KEY_BOOLEAN, value_boolen);
      await mPreferences.get(KEY_BOOLEAN, 'default').then((data: lang.ISendable) => {
        console.info(TAG + `Succeeded in getting value of KEY_BOOLEAN. Data: ${data}`);
        expect(data === value_boolen).assertTrue()
      }).catch((err: BusinessError) => {
        console.error(TAG + `Failed to get value of KEY_BOOLEAN. code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      })
      done();
    });

    /**
     * @tc.name testSendablePreferencesPutBigint0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_0400
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesPutBigint0100', 0, async (done: Function) => {
      await mPreferences.put(KEY_BIGINT, value_bigint);
      await mPreferences.get(KEY_BIGINT, 'default').then((data: lang.ISendable) => {
        console.info(TAG + `Succeeded in getting value of KEY_BIGINT. Data: ${data}`);
        expect(data === value_bigint).assertTrue()
      }).catch((err: BusinessError) => {
        console.error(TAG + `Failed to get value of KEY_BIGINT. code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      })
      done();
    });

    /**
     * @tc.name testSendablePreferencesPutLong0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_0500
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesPutLong0100', 0, async (done: Function) => {
      await mPreferences.put(KEY_LONG, value_long);
      await mPreferences.get(KEY_LONG, 'default').then((data: lang.ISendable) => {
        console.info(TAG + `Succeeded in getting value of KEY_LONG. Data: ${data}`);
        expect(data === value_long).assertTrue()
      }).catch((err: BusinessError) => {
        console.error(TAG + `Failed to get value of KEY_LONG. code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      })
      done();
    });

    /**
     * @tc.name testSendablePreferencesPutArrNumber0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_0600
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesPutArrNumber0100', 0, async (done: Function) => {
      let arrNumber: collections.Array<number> = new collections.Array<number>(123, 456, 789)
      await mPreferences.put(KEY_ARRAY_NUMBER, arrNumber);
      await mPreferences.get(KEY_ARRAY_NUMBER, 'default').then((data: lang.ISendable) => {
        console.info(TAG + `Succeeded in getting value of KEY_ARRAY_NUMBER. Data: ${data}`);
        let dataStr = data as collections.Array<string>
        for (let i = 0; i < arrNumber.length; i++) {
          expect(arrNumber[i]).assertEqual(dataStr[i]);
        }
      }).catch((err: BusinessError) => {
        console.error(TAG + `Failed to get value of KEY_ARRAY_NUMBER. code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      })
      done();
    });

    /**
     * @tc.name testSendablePreferencesPutStringArray0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_0700
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesPutStringArray0100', 0, async (done: Function) => {
      let stringArr: collections.Array<string> = new collections.Array<string>('111', '222', '333');
      await mPreferences.put(KEY_ARRAY_STRING, stringArr);
      console.info(TAG + 'Succeeded in putting value')
      await mPreferences.get(KEY_ARRAY_STRING, 'default').then((data: lang.ISendable) => {
        console.info(TAG + `Succeeded in getting value of KEY_ARRAY_STRING. Data: ${data}`);
        let dataStr = data as collections.Array<string>
        for (let i = 0; i < stringArr.length; i++) {
          expect(stringArr[i]).assertEqual(dataStr[i]);
        }
      }).catch((err: BusinessError) => {
        console.error(TAG + `Failed to get value of KEY_ARRAY_STRING. code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      })
      done();
    });

    /**
     * @tc.name testSendablePreferencesPutArrBoolen0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_0800
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesPutArrBoolen0100', 0, async (done: Function) => {
      let ArrBool: collections.Array<boolean> = new collections.Array<boolean>(true, false, true)
      await mPreferences.put(KEY_ARRAY_BOOL, ArrBool);
      await mPreferences.get(KEY_ARRAY_BOOL, 'default').then((data: lang.ISendable) => {
        console.info(TAG + `Succeeded in getting value of KEY_ARRAY_BOOL. Data: ${data}`);
        let dataStr = data as collections.Array<boolean>;
        for (let i = 0; i < ArrBool.length; i++) {
          expect(ArrBool[i]).assertEqual(dataStr[i]);
        }
      }).catch((err: BusinessError) => {
        console.error(TAG + `Failed to get value of KEY_ARRAY_BOOL. code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      })
      done();
    });

    /**
     * @tc.name testSendablePreferencesGetAll0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_0900
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesGetAll0100', 0, async (done: Function) => {
      await mPreferences.put(KEY_BIGINT, 1452687651565);
      await mPreferences.getAll().then((keyValues: lang.ISendable) => {
        for (let value of Object.keys(keyValues)) {
          console.info(TAG + "getAll " + JSON.stringify(value));
          expect(KEY_BIGINT).assertEqual(value)
        }
      }).catch((err: BusinessError) => {
        console.error(TAG + `Failed to get all key-values. code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      })
      done();
    })

    /**
     * @tc.name testSendablePreferencesHas0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_1000
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesHas0100', 0, async (done: Function) => {
      await mPreferences.clear();
      await mPreferences.put(KEY_BIGINT, 1452687651565);
      await mPreferences.has(KEY_BIGINT).then((val: boolean) => {
        if (val) {
          expect(true).assertEqual(val)
          console.info(TAG + "The key KEY_BIGINT is contained.");
        } else {
          expect().assertFail();
          console.error(TAG + "The key KEY_BIGINT dose not contain.");
        }
      }).catch((err: BusinessError) => {
        console.error(TAG + `Failed to check the key KEY_BIGINT. code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      })
      done();
    })

    /**
     * @tc.name testSendablePreferencesClear0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_1100
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesClear0100', 0, async (done: Function) => {
      await mPreferences.put('KEY_NUMBER', 11);
      let pre = await mPreferences.get('KEY_NUMBER', 'defaultvalue')
      console.info(TAG + 'succeed in getting pre' + JSON.stringify(pre))
      expect(pre).assertEqual(11);
      await mPreferences.clear();
      let pre1 = await mPreferences.get('KEY_NUMBER', "defaultvalue")
      console.info(TAG + 'succeed in getting pre1' + JSON.stringify(pre1))
      expect("defaultvalue").assertEqual(pre1)
      console.info(TAG + 'succeed in clear');
      done();
    })

    /**
     * @tc.name testSendablePreferencesGetAllSync0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_1200
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesGetAllSync0100', 0, async (done: Function) => {
      let arrNumber: collections.Array<number> = new collections.Array<number>(111, 234, 789)
      let stringArr: collections.Array<string> = new collections.Array<string>('111', '222', '333');
      mPreferences.clearSync();
      mPreferences.putSync(KEY_FLOAT, 3.14);
      mPreferences.putSync(KEY_NUMBER, 123);
      mPreferences.putSync(KEY_ARRAY_NUMBER, arrNumber);
      mPreferences.putSync(KEY_ARRAY_STRING, stringArr);
      await mPreferences.flush();
      let obj: lang.ISendable = mPreferences.getAllSync();
      for (let value of Object.keys(obj)) {
        console.info(TAG + "getAll " + JSON.stringify(value));
      }
      console.info(TAG + 'success in getting KEY_NUMBER')
      expect(3.14).assertEqual(Object.values(obj)[0])
      expect(123).assertEqual(Object.values(obj)[1])
      let arr: collections.Array<number> = Object.values(obj)[2]
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(arrNumber[i])
      }
      let srr: collections.Array<number> = Object.values(obj)[3]
      for (let i = 0; i < srr.length; i++) {
        expect(srr[i]).assertEqual(stringArr[i])
      }
      done();
    })

    /**
     * @tc.name testSendablePreferencesGetSync0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_1300
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesGetSync0100', 0, async (done: Function) => {
      try {
        mPreferences.putSync(KEY_NUMBER, 444);
        let value: lang.ISendable = mPreferences.getSync(KEY_NUMBER, 'default');
        console.info(TAG + 'success in getsync')
        expect(444).assertEqual(value)
      } catch {
        console.error(TAG + `Failed to get value of KEY_ARRAY_NUMBER`);
        expect().assertFalse()
      }
      done();
    })

    /**
     * @tc.name testSendablePreferencesHasSync0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_1400
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesHasSync0100', 0, async (done: Function) => {
      mPreferences.clearSync();
      mPreferences.putSync(KEY_STRING, "test");
      const ret = mPreferences.hasSync(KEY_STRING);
      expect(true).assertEqual(ret);
      done();
    })

    /**
     * @tc.name testSendablePreferencesDelete0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_1500
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesDelete0100', 0, async (done: Function) => {
      try {
        await mPreferences.put(KEY_BIGINT, 1452687651565);
        await mPreferences.delete(KEY_BIGINT).then(() => {
          console.info(TAG + "Succeeded in deleting the key KEY_BIGINT.")
        }).catch((err: BusinessError) => {
          expect(false).assertTrue()
          console.error(TAG + `Failed to delete the key 'startup'. code: ${err.code}, message: ${err.message}`);
        })
      } catch (err) {
        console.info("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name testSendablePreferencesDelete0200
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_1600
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesDelete0200', 0, async (done: Function) => {
      try {
        await mPreferences.put(KEY_NUMBER, 777)
        await mPreferences.delete(KEY_NUMBER).then(() => {
          console.info(TAG + "Succeeded in deleting the key KEY_NUMBER");
        }).catch((err: BusinessError) => {
          console.info("delete err =" + err + ", code =" + err.code + ", message =" + err.message);
          expect(false).assertTrue();
        });
      } catch (err) {
        console.info("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name testSendablePreferencesDeleteSync0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_1700
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesDeleteSync0100', 0, async (done: Function) => {
      try {
        mPreferences.putSync(KEY_NUMBER, "abc");
        let data = mPreferences.getSync(KEY_NUMBER, "default");
        console.info(TAG + 'success in getting' + JSON.stringify(data));
        expect("abc").assertEqual(data);
        mPreferences.deleteSync(KEY_NUMBER);
        let data2 = mPreferences.getSync(KEY_NUMBER, "default");
        console.info(TAG + 'success in getting' + JSON.stringify(data2));
        expect("default").assertEqual(data2);
      } catch (err) {
        console.info(TAG + "trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name testSendablePreferencesGetPreferencesSync0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_1800
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesGetPreferencesSync0100', 0, async (done: Function) => {
      try {
        const options2: sendablePreferences.Options = {
          name: 'getPreferencesTest'
        }
        const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
        const context = delegator.getAppContext().getApplicationContext();
        let mPreferences2 = sendablePreferences.getPreferencesSync(context, options2)
        mPreferences2.putSync('number', 333);
        let data = mPreferences2.getSync('number', 'default')
        console.info(TAG + 'success in getting' + JSON.stringify(data))
        expect(333).assertEqual(data);
        sendablePreferences.removePreferencesFromCacheSync(context, options2)
        await sendablePreferences.deletePreferences(context, options2)
        done()
      } catch (err) {
        console.info(TAG + "trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.name testSendablePreferencesOn0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_1900
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesOn0100', 0, async (done: Function) => {
      await mPreferences.clear();
      let observer = (key: string) => {
        console.info(TAG + 'testPreferencesRegisterObserver001 key' + key);
        expect('abcd').assertEqual(key);
      };
      mPreferences.on('change', observer);
      mPreferences.putSync(KEY_STRING, 'abcd');
      mPreferences.flush();
      mPreferences.off('change', observer)
      done();
    })

    /**
     * @tc.name testSendablePreferencesOn0200
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_2000
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesOn0200', 0, async (done: Function) => {
      let observer = (key: string) => {
        console.info(TAG + 'testPreferencesRegisterObserver0200 key' + key);
        expect('abc').assertEqual(key);
      }
      mPreferences.on('multiProcessChange', observer);
      mPreferences.putSync(KEY_STRING, 'abc');
      await mPreferences.flush();
      mPreferences.off('multiProcessChange', observer)
      done();
    })

    /**
     * @tc.name testSendablePreferencesOn0300
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_2100
     * @tc.desc put PutNumber promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSendablePreferencesOn0300', 0, async (done: Function) => {
      let observer = (data: lang.ISendable) => {
        console.info(TAG + `observer : ${data}`)
        expect("name").assertEqual(keys[0])
      }
      let keys = ['name', 'age'];
      mPreferences.on('dataChange', keys, observer);
      mPreferences.putSync('name', 'xiaohong');
      mPreferences.putSync('weight', 125);
      mPreferences.flush().then(() => {
        console.info("Succeeded in flushing.");
        mPreferences.off('dataChange', keys, observer);
      }).catch((err: BusinessError) => {
        console.error(`Failed to flush. code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      });
      done()
    })
    })
}