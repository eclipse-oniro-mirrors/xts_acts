/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
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
     * @tc.name   testSendablePreferencesOn0210
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_2300
     * @tc.desc   put PutNumber promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendablePreferencesOn0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let observer = (key: string) => {
        console.info("====>testSendablePreferencesOn0210 multiProcessChange key " + key + " changed.");
      }
      try {
        mPreferences.on("multiProcessChange", null);
        console.info("====>testSendablePreferencesOn0210 multiProcessChange success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>testSendablePreferencesOn0210 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testGetPreferencesHelper003
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_2400
     * @tc.desc   getPreferences interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetPreferencesHelper003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const options:sendablePreferences.Options= {name: null}
      try {
        await sendablePreferences.getPreferences(context, options);
        console.info("====>testGetPreferencesHelper003 getPreferences success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>testGetPreferencesHelper003 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testGetPreferencesSyncinterface002
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_2500
     * @tc.desc   getPreferencesSync interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetPreferencesSyncinterface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const options:sendablePreferences.Options= {name: null}
      try {
        sendablePreferences.getPreferencesSync(context, options);
        console.info("====>testGetPreferencesSyncinterface002 getPreferencesSync success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>testGetPreferencesSyncinterface002 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testRemovePreferencesFromCache002
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_2600
     * @tc.desc   removePreferencesFromCache interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRemovePreferencesFromCache002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const options:sendablePreferences.Options= {name: null}
      try {
        await sendablePreferences.removePreferencesFromCache(context, options);
        console.info("====>testRemovePreferencesFromCache002 removePreferencesFromCache success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>testRemovePreferencesFromCache002 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_Preferences_removePreferencesFromCacheSync_0200
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_2700
     * @tc.desc   removePreferencesFromCacheSync interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_Preferences_removePreferencesFromCacheSync_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const options:sendablePreferences.Options= {name: null}
      try {
        sendablePreferences.removePreferencesFromCacheSync(context, options);
        console.info("====>SUB_DDM_Preferences_removePreferencesFromCacheSync_0200 removePreferencesFromCacheSync success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_DDM_Preferences_removePreferencesFromCacheSync_0200 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testDeletePreferencesHelper003
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceHelperTest_2800
     * @tc.desc   deletePreferences interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeletePreferencesHelper003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const options:sendablePreferences.Options= {name: null}
      try {
        await sendablePreferences.deletePreferences(context, options);
        console.info("====>testDeletePreferencesHelper003 deletePreferences success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>testDeletePreferencesHelper003 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testPreferencesGetErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_2900
     * @tc.desc   get string promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesGetErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.get(null, null);
        console.info("====>testPreferencesGetErr0100 get success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>testPreferencesGetErr0100 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testPreferencesGetSyncErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_3000
     * @tc.desc   get string promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesGetSyncErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.getSync(null, null);
        console.info("====>testPreferencesGetSyncErr0100 getSync success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>testPreferencesGetSyncErr0100 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testPreferencesHasErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_3100
     * @tc.desc   get string promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesHasErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.has(null);
        console.info("====>testPreferencesHasErr0100 has success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>testPreferencesHasErr0100 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testPreferencesHasSyncErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_3200
     * @tc.desc   get string promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesHasSyncErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.hasSync(null);
        console.info("====>testPreferencesHasSyncErr0100 HasSync success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>testPreferencesHasSyncErr0100 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })


    /**
     * @tc.name   testPreferencesPutErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_3300
     * @tc.desc   get string promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesPutErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.put(null, null);
        console.info("====>testPreferencesPutErr0100 put success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>testPreferencesPutErr0100 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testPreferencesPutSyncErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_3400
     * @tc.desc   get string promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesPutSyncErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.putSync(null, null);
        console.info("====>testPreferencesPutSyncErr0100 putSync success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>testPreferencesPutSyncErr0100 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testPreferencesDeleteErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_3500
     * @tc.desc   get string promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesDeleteErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.delete(null);
        console.info("====>testPreferencesDeleteErr0100 delete success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>testPreferencesDeleteErr0100 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testPreferencesDeleteSyncErr0100
     * @tc.number SUB_DistributedData_Preference_SDK_PreferenceJsApiPromiseTest_3600
     * @tc.desc   get string promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesDeleteSyncErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        mPreferences.deleteSync(null);
        console.info("====>testPreferencesDeleteSyncErr0100 deleteSync success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>testPreferencesDeleteSyncErr0100 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSendablePreferencesOff0210
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_3700
     * @tc.desc   put PutNumber promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendablePreferencesOff0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let observer = (key: string) => {
        console.info("====>testSendablePreferencesOff0210 multiProcessChange off key " + key + " changed.");
      }
      try {
        mPreferences.off(undefined);
        console.info("====>testSendablePreferencesOff0210 multiProcessChange off success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>testSendablePreferencesOff0210 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSendablePreferencesOn0400
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_3800
     * @tc.desc   put PutNumber promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendablePreferencesOn0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let observer = (data: lang.ISendable) => {
        console.info(TAG + `observer : ${data}`)
        done();
        expect("name").assertEqual(keys[0])
        mPreferences.off('dataChange', keys);
      }
      let keys = ['name', 'age'];
      try {
        mPreferences.on(undefined, keys, observer);
        console.info("====>testSendablePreferencesOn0400 multiProcessChange off success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>testSendablePreferencesOn0400 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })


    /**
     * @tc.name   testSendablePreferencesOnErr0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_3900
     * @tc.desc   put PutNumber promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendablePreferencesOnErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.clear();
        mPreferences.on('change', (undefine) => {
        console.info(TAG + 'testPreferencesRegisterObserver001 keyValue' + mPreferences.getSync(KEY_STRING,"aaa"));
        done();
        expect('abcd').assertEqual(mPreferences.getSync(KEY_STRING,"aaa"));
        mPreferences.off('change')
        });
        mPreferences.putSync(KEY_STRING, 'abcd');
        await mPreferences.flush();
      } catch(err){
       console.info("====>testSendablePreferencesOnerr0100 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })


    /**
     * @tc.name   testSendablePreferencesOnErr0200
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_4000
     * @tc.desc   put PutNumber promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendablePreferencesOnErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.clear();
        mPreferences.on('dataChange', (undefine) => {
        console.info(TAG + 'testPreferencesRegisterObserver001 keyValue' + mPreferences.getSync(KEY_STRING,"aaa"));
        done();
        expect('abcd').assertEqual(mPreferences.getSync(KEY_STRING,"aaa"));
        mPreferences.off('dataChange')
        });
        mPreferences.putSync(KEY_STRING, 'abcd');
        await mPreferences.flush();
      } catch(err){
       console.info("====>testSendablePreferencesOnerr0200 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })



    /**
     * @tc.name   testSendablePreferencesOnerr0300
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_4100
     * @tc.desc   put PutNumber promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendablePreferencesOnerr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.clear();
        mPreferences.on('multiProcessChange', (undefine) => {
        console.info(TAG + 'testPreferencesRegisterObserver001 keyValue' + mPreferences.getSync(KEY_STRING,"aaa"));
        done();
        expect('abcd').assertEqual(mPreferences.getSync(KEY_STRING,"aaa"));
        mPreferences.off('multiProcessChange')
        });
        mPreferences.putSync(KEY_STRING, 'abcd');
        await mPreferences.flush();
      } catch(err){
       console.info("====>testSendablePreferencesOnerr0300 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
    })


    /**
     * @tc.name   testSendablePreferencesOffErr0100
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_4300
     * @tc.desc   put PutNumber promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendablePreferencesOffErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try{
        await mPreferences.clear();
        let observer = (key: string) => {
        console.info(TAG + 'testPreferencesRegisterObserver001 keyValue' + mPreferences.getSync(KEY_STRING,"aaa"));
        expect('abcd').assertEqual(mPreferences.getSync(KEY_STRING,"aaa"));
        done();
        }
        mPreferences.on('change', observer);
        mPreferences.putSync(KEY_STRING, 'abcd');
        await mPreferences.flush();
        mPreferences.off('change',(undefine) => {
        console.info(TAG + 'testPreferencesRegisterObserver001 keyValue' + mPreferences.getSync(KEY_STRING,"aaa"));
        expect().assertFail();
        done();
        })
      } catch(err){
        console.info("====>testSendablePreferencesOnerr0300 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
      })


    /**
     * @tc.name   testSendablePreferencesOffErr0200
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_4400
     * @tc.desc   put PutNumber promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendablePreferencesOffErr0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try{
        await mPreferences.clear();
        let observer = (key: string) => {
        console.info(TAG + 'testPreferencesRegisterObserver001 keyValue' + mPreferences.getSync(KEY_STRING,"aaa"));
        expect('abcd').assertEqual(mPreferences.getSync(KEY_STRING,"aaa"));
        done();
        }
        mPreferences.on('multiProcessChange', observer);
        mPreferences.putSync(KEY_STRING, 'abcd');
        await mPreferences.flush();
        mPreferences.off('multiProcessChange',(undefine) => {
        console.info(TAG + 'testPreferencesRegisterObserver001 keyValue' + mPreferences.getSync(KEY_STRING,"aaa"));
        expect().assertFail();
        done();
        })
      } catch(err){
        console.info("====>testSendablePreferencesOnerr0300 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
      })



    /**
     * @tc.name   testSendablePreferencesOffErr0300
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_4500
     * @tc.desc   put PutNumber promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendablePreferencesOffErr0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try{
        await mPreferences.clear();
        let observer = (key: string) => {
        console.info(TAG + 'testSendablePreferencesOffErr0300 keyValue' + mPreferences.getSync(KEY_STRING,"aaa"));
        expect('abcd').assertEqual(mPreferences.getSync(KEY_STRING,"aaa"));
        done();
        }
        mPreferences.on('dataChange', observer);
        mPreferences.putSync(KEY_STRING, 'abcd');
        await mPreferences.flush();
        mPreferences.off('dataChange',(undefine) => {
        console.info(TAG + 'testSendablePreferencesOffErr0300 keyValue' + mPreferences.getSync(KEY_STRING,"aaa"));
        expect().assertFail();
        done();
        })
      } catch(err){
        console.info("====>testSendablePreferencesOffErr0300 catch: " + JSON.stringify(err));
        expect(err.code === '401').assertTrue();
        done();
      }
      })



      /**
       * @tc.name   testSendablePreferencesOnErr0400
       * @tc.number testSendablePreferencesOnErr0400
       * @tc.desc   testSendablePreferencesOnErr0400
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testSendablePreferencesOnErr0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        for(let i = 0;i<100;i++){
          mPreferences.on('multiProcessChange', (key: string) => {
            console.info(TAG + 'testSendablePreferencesOnErr0400 keyValue' +  key);
            done();
          })
        }
      } catch (err) {
        console.error( TAG + 'testSendablePreferencesOnErr0400' + err.message + err.code);
        expect(err.code).assertEqual(15500019);
        mPreferences.off('multiProcessChange');
        done();
      }
    })



      /**
       * @tc.name   testSendablePreferencesgetpreferenceErr0100
       * @tc.number testSendablePreferencesgetpreferenceErr0100
       * @tc.desc   testSendablePreferencesgetpreferenceErr0100
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testSendablePreferencesgetpreferenceErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const options = {
            name: 'test_preferences',
            dataGroupId: "12345678"
        }
        mPreferences = await sendablePreferences.getPreferences(context, options);
        expect().assertFail();
        done();
      } catch(err) {
        onsole.info('getPreferencesSync is fail' + err.code);
        expect('15501002').assertEqual(err.code);
        done();
        }

    })





      /**
       * @tc.name   testSendablePreferencesgetpreferencesyncErr0100
       * @tc.number testSendablePreferencesgetpreferencesyncErr0100
       * @tc.desc   testSendablePreferencesgetpreferencesyncErr0100
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testSendablePreferencesgetpreferencesyncErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const options = {
            name: 'test_preferences',
            dataGroupId: "12345678"
        }
        mPreferences = await sendablePreferences.getPreferencesSync(context, options);
        expect().assertFail();
        done();
      } catch(err) {
        onsole.info('getPreferencesSync is fail' + err.code);
        expect('15501002').assertEqual(err.code);
        done();
        }

    })




      /**
       * @tc.name   testSendablePreferencesdeletePreferencesErr0100
       * @tc.number testSendablePreferencesdeletePreferencesErr0100
       * @tc.desc   testSendablePreferencesdeletePreferencesErr0100
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testSendablePreferencesdeletePreferencesErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const options = {
            name: 'test_preferences',
            dataGroupId: "12345678"
        }
        mPreferences = await sendablePreferences.deletePreferences(context, options);
        expect().assertFail();
        done();
      } catch(err) {
        onsole.info('getPreferencesSync is fail' + err.code);
        expect('15501002').assertEqual(err.code);
        done();
        }

    })




      /**
       * @tc.name   testSendablePreferencesremovePreferencesFromCacheErr0100
       * @tc.number testSendablePreferencesremovePreferencesFromCacheErr0100
       * @tc.desc   testSendablePreferencesremovePreferencesFromCacheErr0100
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testSendablePreferencesremovePreferencesFromCacheErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const options = {
            name: 'test_preferences',
            dataGroupId: "12345678"
        }
        mPreferences = await sendablePreferences.removePreferencesFromCache(context, options);
        expect().assertFail();
        done();
      } catch(err) {
        onsole.info('getPreferencesSync is fail' + err.code);
        expect('15501002').assertEqual(err.code);
        done();
        }

    })




      /**
       * @tc.name   testSendablePreferencesremovePreferencesFromCacheSyncErr0100
       * @tc.number testSendablePreferencesremovePreferencesFromCacheSyncErr0100
       * @tc.desc   testSendablePreferencesremovePreferencesFromCacheSyncErr0100
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testSendablePreferencesremovePreferencesFromCacheSyncErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const options = {
            name: 'test_preferences',
            dataGroupId: "12345678"
        }
        mPreferences = await sendablePreferences.removePreferencesFromCacheSync(context, options);
        expect().assertFail();
        done();
      } catch(err) {
        onsole.info('getPreferencesSync is fail' + err.code);
        expect('15501002').assertEqual(err.code);
        done();
        }

    })



    /**
     * @tc.name   testSendablePreferencesPutNumber0300
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_5200
     * @tc.desc   put PutNumber promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendablePreferencesPutNumber0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.putsync('test', MAX_VALUE_LENGTH);
        let data = await mPreferences.getSync("test", "defaultvalue");
        expect(MAX_VALUE_LENGTH == mPreferences.getSync("test", "defaultvalue");).assertTrue();
        console.info(TAG + 'succeed in getting');
      } catch (err) {
        console.info(TAG + "trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect().assertFail();
      }
      done();
    })


    /**
     * @tc.name   testSendablePreferencesPutNumber0200
     * @tc.number SUB_DistributedData_SendablePreference_SDK_PreferenceEtsApiPromiseTest_5300
     * @tc.desc   put PutNumber promise interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendablePreferencesPutNumber0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await mPreferences.put(MAX_KEY_LENGTH, 333);
        let data = await mPreferences.get(MAX_KEY_LENGTH, 'default');
        expect(data === 333).assertTrue();
        console.info(TAG + 'succeed in getting');
      } catch (err) {
        console.info(TAG + "trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect().assertFail();
      }
      done();
    })




    
    /**
     * @tc.name   testSendablePreferencesHasPromiseFalseTest0100
     * @tc.number testSendablePreferencesHasPromiseFalseTest0100
     * @tc.desc   testSendablePreferencesHasPromiseFalseTest0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendablePreferencesHasPromiseFalseTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'testSendablePreferencesHasPromiseFalseTest0100 start' );
      try {
        let ret: boolean = await mPreferences.has(KEY_STRING);
        expect(ret).assertEqual(false);
        done();
      } catch (err) {
        console.info(TAG +"testSendablePreferencesHasPromiseFalseTest0100 catch: " + err.code + err.messagr);
        expect().assertFail();
        done();
      }
    })


    
    /**
     * @tc.name   testSendablePreferencesHasSyncPromiseFalseTest0100
     * @tc.number testSendablePreferencesHasSyncPromiseFalseTest0100
     * @tc.desc   testSendablePreferencesHasSyncPromiseFalseTest0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendablePreferencesHasSyncPromiseFalseTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'testSendablePreferencesHasSyncPromiseFalseTest0100 start' );
      try {
        let ret: boolean = await mPreferences.hasSync(KEY_STRING);
        expect(ret).assertEqual(false);
        done();
      } catch (err) {
        console.info(TAG +"testSendablePreferencesHasSyncPromiseFalseTest0100 catch: " + err.code + err.messagr);
        expect().assertFail();
        done();
      }
    })


  })
}