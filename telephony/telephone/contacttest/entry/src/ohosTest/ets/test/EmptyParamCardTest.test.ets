/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, afterEach, it, expect, beforeEach, Level, Size, TestType } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import dataShare from '@ohos.data.dataShare';
import dataSharePredicates from '@ohos.data.dataSharePredicates';

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.WRITE_CONTACTS" | "ohos.permission.READ_CONTACTS";
  let list: MyPermissions[] = ['ohos.permission.WRITE_CONTACTS', 'ohos.permission.READ_CONTACTS'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.contacttest', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
}

async function addCard() {
  try {
    let context: Context = AppStorage.get('context') as Context;
    if (!context) {
        console.warn('addCard: no context available');
        return -1;
    }
    let DAHelper: dataShare.DataShareHelper = await dataShare.createDataShareHelper(context, 'datashare:///com.ohos.contactsdataability');
    let insertValues: Record<string, string | number> = {
      'display_name': 'testDisplayName',
    };
    let data:number = await DAHelper.insert(
      'datashare:///com.ohos.contactsdataability/profile/raw_contact',
      insertValues
    );
    const id:string = data.toString();
    console.log(`addCard ID-> ${id}`);
    const dataArr: Array<Record<string, string | number>> = [
      {
        'raw_contact_id': id,
        'detail_info': 'testName',
        'alpha_name': 'alphaName',
        'type_id': 6,
        'extend7': 0
      }, {
      'raw_contact_id': id,
      'detail_info': '123456',
      'custom_data': 1,
      'type_id': 5,
    }
    ];
    await DAHelper.batchInsert('datashare:///com.ohos.contactsdataability/profile/contact_data', dataArr);
    return data
  }catch (err) {
    console.log(`addCard: err-> ${JSON.stringify(err)}`);
    return -1
  }
}

async function deleteCard() {
  let context: Context = AppStorage.get('context') as Context;
  if (!context) {
    console.warn('deleteCard: no context available');
    return 0;
  }
  try {
      let DAHelper: dataShare.DataShareHelper = await dataShare.createDataShareHelper(context, 'datashare:///com.ohos.contactsdataability');
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let DataSharePredicates:dataSharePredicates.DataSharePredicates = predicates.prefixKey('raw_contact_id');
      let del: number = await DAHelper.delete('datashare:///com.ohos.contactsdataability/profile/contact_data', DataSharePredicates);
      let predicates1: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let DataSharePredicates1:dataSharePredicates.DataSharePredicates = predicates.prefixKey('id');
      await DAHelper.delete('datashare:///com.ohos.contactsdataability/profile/raw_contact', DataSharePredicates1);
      return del
  } catch (err) {
      console.log(`deleteCard: err-> ${JSON.stringify(err)}`);
      return 0;
  }
}

export default function EmptyParamCardTest() {
    describe('EmptyParamCardTest', () => {
        
        beforeAll(async (done: Function) => {
            console.info("beforeAll case");
            await getPermissions();
            done();
        });

        afterEach(async (done: Function) => {
            try {
                let data:number = await deleteCard();
                console.info(`afterEach catch success: ${data}`);
                done();
            } catch (error) {
                console.info(`afterEach catch error: ${JSON.stringify(error)}`);
                done();
            }
        });

    /**
     * @tc.name   contactsApi_isMyCard_empty_test_3400
     * @tc.number contactsApi_isMyCard_empty_test_3400
     * @tc.desc   Function test with undefined context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_isMyCard_empty_test_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let cardId: number = await addCard();
        const caseName: string = "contactsApi_isMyCard_empty_test_3400";
        console.info(`${caseName} test start`);
        console.info(`${caseName} cardId: ${cardId}`);
        try {
            const result = await contact.isMyCard(undefined, cardId);
            console.info(`${caseName} : result = ${JSON.stringify(result)}`);
            expect(result).assertTrue();
            done();
        } catch (error) {
            console.info(`${caseName} : isMyCard error = ${error.code}, ${error.message}`);
            expect(error.code == 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_isMyCard_empty_test_3500
     * @tc.number contactsApi_isMyCard_empty_test_3500
     * @tc.desc   Function test with undefined contact ID (callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_isMyCard_empty_test_3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const caseName: string = "contactsApi_isMyCard_empty_test_3500";
        console.info(`${caseName} test start`);
        try {
            let context: Context = AppStorage.get('context') as Context;
            contact.isMyCard(context, undefined, (err: BusinessError, result: boolean) => {
                if (err) {
                    console.error(`${caseName} : isMyCard err = ${err.code}, ${err.message}`);
                    done();
                } else {
                    console.info(`${caseName} : result = ${JSON.stringify(result)}`);
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`${caseName} : isMyCard error = ${error.code}, ${error.message}`);
            expect(error.code == 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_queryContactsCount_empty_test_4500
     * @tc.number contactsApi_queryContactsCount_empty_test_4500
     * @tc.desc   Function test with undefined context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_queryContactsCount_empty_test_4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const caseName: string = "contactsApi_queryContactsCount_empty_test_4500";
        console.info(`${caseName} test start`);
        try {
            const count = await contact.queryContactsCount(undefined);
            console.info(`${caseName} : count = ${JSON.stringify(count)}`);
            done();
        } catch (error) {
            console.info(`${caseName} : queryContactsCount error = ${error.code}, ${error.message}`);
            expect(error != null).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_addContacts_empty_test_4600
     * @tc.number contactsApi_addContacts_empty_test_4600
     * @tc.desc   Function test with null context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_addContacts_empty_test_4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const caseName: string = "contactsApi_addContacts_empty_test_4600";
        console.info(`${caseName} test start`);
        try {
            let testContacts: Array<contact.Contact> = [];
            const result = await contact.addContacts(null, testContacts);
            console.info(`${caseName} : result = ${JSON.stringify(result)}`);
            done();
        } catch (error) {
            console.info(`${caseName} : addContacts error = ${error.code}, ${error.message}`);
            expect(error != null).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_addContacts_empty_test_4700
     * @tc.number contactsApi_addContacts_empty_test_4700
     * @tc.desc   Function test with null contacts array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_addContacts_empty_test_4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const caseName: string = "contactsApi_addContacts_empty_test_4700";
        console.info(`${caseName} test start`);
        try {
            let context: Context = AppStorage.get('context') as Context;
            const result = await contact.addContacts(context, null);
            console.info(`${caseName} : result = ${JSON.stringify(result)}`);
            expect().assertFail();
            done();
        } catch (error) {
            console.info(`${caseName} : addContacts error = ${error.code}, ${error.message}`);
            expect(error.code == 16700002).assertTrue();
            done();
        }
    });

    })
}



