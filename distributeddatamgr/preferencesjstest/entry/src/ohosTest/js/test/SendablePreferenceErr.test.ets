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

export default function sendablePreferencesErrTest() {
  describe('sendablePreferencesErrTest', () => {
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
            dataGroupId: "123456"
        }
        mPreferences = await sendablePreferences.getPreferences(context, options);
        expect().assertFail();
        done();
      } catch(err) {
        onsole.info('getPreferencesSync is fail' + err.code);
        expect('15501001').assertEqual(err.code);
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
            dataGroupId: "123456"
        }
        mPreferences = await sendablePreferences.getPreferencesSync(context, options);
        expect().assertFail();
        done();
      } catch(err) {
        onsole.info('getPreferencesSync is fail' + err.code);
        expect('15501001').assertEqual(err.code);
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
            dataGroupId: "123456"
        }
        mPreferences = await sendablePreferences.deletePreferences(context, options);
        expect().assertFail();
        done();
      } catch(err) {
        onsole.info('getPreferencesSync is fail' + err.code);
        expect('15501001').assertEqual(err.code);
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
            dataGroupId: "123456"
        }
        mPreferences = await sendablePreferences.removePreferencesFromCache(context, options);
        expect().assertFail();
        done();
      } catch(err) {
        onsole.info('getPreferencesSync is fail' + err.code);
        expect('15501001').assertEqual(err.code);
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
            dataGroupId: "123456"
        }
        mPreferences = await sendablePreferences.removePreferencesFromCacheSync(context, options);
        expect().assertFail();
        done();
      } catch(err) {
        onsole.info('getPreferencesSync is fail' + err.code);
        expect('15501001').assertEqual(err.code);
        done();
        }

    })




        /**
         * @tc.name   testPreferencesRemovePreferencesFromCachePromiserr0100
         * @tc.number testPreferencesRemovePreferencesFromCachePromiserr0100
         * @tc.desc   testPreferencesRemovePreferencesFromCachePromiserr0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testPreferencesRemovePreferencesFromCachePromiserr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:GSKV
            }
            const options1 = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:XML
            }
            await mPreferences removePreferencesFromCache(context, options);
            await mPreferences removePreferencesFromCache(context, options1);
            expect().assertFail();
            done();
        } catch(err) {
            onsole.info('removePreferencesFromCache is fail' + err.code);
            expect(801).assertEqual(err.code);
            done();
            }

        })





        /**
         * @tc.name   testPreferencesRemovePreferencesFromCacheSyncErr0100
         * @tc.number testPreferencesRemovePreferencesFromCacheSyncErr0100
         * @tc.desc   testPreferencesRemovePreferencesFromCacheSyncErr0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testPreferencesRemovePreferencesFromCacheSyncErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:GSKV
            }
            const options1 = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:XML
            }
            await mPreferences removePreferencesFromCacheSync(context, options);
            await mPreferences removePreferencesFromCacheSync(context, options1);
            expect().assertFail();
            done();
        } catch(err) {
            onsole.info('getPreferencesSync is fail' + err.code);
            expect(801).assertEqual(err.code);
            done();
            }
        })






        /**
         * @tc.name   testSendablePreferencesDeletePreferencesPromiseErr0100
         * @tc.number testSendablePreferencesDeletePreferencesPromiseErr0100
         * @tc.desc   testSendablePreferencesDeletePreferencesPromiseErr0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSendablePreferencesDeletePreferencesPromiseErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:GSKV
            }
            const options1 = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:XML
            }
            await mPreferences deletePreferences(context, options);
            await mPreferences deletePreferences(context, options1);
            expect().assertFail();
            done();
        } catch(err) {
            onsole.info('getPreferencesSync is fail' + err.code);
            expect(801).assertEqual(err.code);
            done();
            }
        })






        /**
         * @tc.name   testSendablePreferencesgetPreferencesSyncErr0100
         * @tc.number testSendablePreferencesgetPreferencesSyncErr0100
         * @tc.desc   testSendablePreferencesgetPreferencesSyncErr0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSendablePreferencesgetPreferencesSyncErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:GSKV
            }
            const options1 = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:XML
            }
            await mPreferences getPreferencesSync(context, options);
            await mPreferences getPreferencesSync(context, options1);
            expect().assertFail();
            done();
        } catch(err) {
            onsole.info('getPreferencesSync is fail' + err.code);
            expect(801).assertEqual(err.code);
            done();
            }
        })






        /**
         * @tc.name   testSendablePreferencesgetPreferencesPromiseErr0100
         * @tc.number testSendablePreferencesgetPreferencesPromiseErr0100
         * @tc.desc   testSendablePreferencesgetPreferencesPromiseErr0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSendablePreferencesgetPreferencesPromiseErr0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
            const options = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:GSKV
            }
            const options1 = {
                name: 'test_preferences',
                dataGroupId: "123456",
                storageType:XML
            }
            await mPreferences getPreferences(context, options);
            await mPreferences getPreferences(context, options1);
            expect().assertFail();
            done();
        } catch(err) {
            onsole.info('getPreferencesSync is fail' + err.code);
            expect(801).assertEqual(err.code);
            done();
            }

        })


  })
}