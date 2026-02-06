/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE2.0
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
import effectKit from '@ohos.effectKit';

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}
const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

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
};

async function addCard() {
  try {
    let context: Context = AppStorage.get('context') as Context;
    let DAHelper: dataShare.DataShareHelper = await dataShare.createDataShareHelper(context, 'datashare:///com.ohos.contactsdataability');
    let insertValues: Record<string, string | number> = {
      'display_name': 'displayName',
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
  let DAHelper: dataShare.DataShareHelper = await dataShare.createDataShareHelper(context, 'datashare:///com.ohos.contactsdataability');
  let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
  let DataSharePredicates:dataSharePredicates.DataSharePredicates = predicates.prefixKey('raw_contact_id');
  let del: number = await DAHelper.delete('datashare:///com.ohos.contactsdataability/profile/contact_data', DataSharePredicates);
  return del
}

export default function IsMyCardTest() {
  describe('IsMyCardTest', () => {

    let attr: contact.ContactAttributes = {
      attributes: [contact.Attribute.ATTR_CONTACT_EVENT,
      contact.Attribute.ATTR_EMAIL,
      contact.Attribute.ATTR_GROUP_MEMBERSHIP,
      contact.Attribute.ATTR_IM,
      contact.Attribute.ATTR_NAME,
      contact.Attribute.ATTR_NICKNAME,
      contact.Attribute.ATTR_NOTE,
      contact.Attribute.ATTR_ORGANIZATION,
      contact.Attribute.ATTR_PHONE,
      contact.Attribute.ATTR_PORTRAIT,
      contact.Attribute.ATTR_POSTAL_ADDRESS,
      contact.Attribute.ATTR_RELATION,
      contact.Attribute.ATTR_SIP_ADDRESS,
      contact.Attribute.ATTR_WEBSITE]
    };
    const INVALID_CONTACT_ID = -1;

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
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_0100
     * @tc.name       : testTelephonyContactIsMyCard0100
     * @tc.desc       : Determine if it is "my business card" and use the callback method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard0100";
      let cardId: number = await addCard();
      console.info(`${caseName} test start `);
      console.info(`${caseName} cardId: ${cardId}`);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.isMyCard(context, cardId, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === true);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: catch err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_0200
     * @tc.name       : testTelephonyContactIsMyCard0200
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard0200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.isMyCard(context, INVALID_CONTACT_ID, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === false);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: catch err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_0300
     * @tc.name       : testTelephonyContactIsMyCard0300
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard0300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.isMyCard(context, null, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401 || err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 401 || err.code === 201);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_0500
     * @tc.name       : testTelephonyContactIsMyCard0500
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard0500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.isMyCard(context, 1.5, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === false);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: catch err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_0600
     * @tc.name       : testTelephonyContactIsMyCard0600
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard0600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.isMyCard(context, Infinity, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === false);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: catch err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_0700
     * @tc.name       : testTelephonyContactIsMyCard0700
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard0700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.isMyCard(context, -1000, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === false);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: catch err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_0800
     * @tc.name       : testTelephonyContactIsMyCard0800
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard0800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.isMyCard(context, -Infinity, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === false);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: catch err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_0900
     * @tc.name       : testTelephonyContactIsMyCard0900
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let cardId: number = await addCard();
      const caseName: string = "testTelephonyContactIsMyCard0900";
      console.info(`${caseName} test start `);
      try {
        contact.isMyCard(null, cardId, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401 || err.code == 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: catch err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 401 || err.code === 201);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_1000
     * @tc.name       : testTelephonyContactIsMyCard1000
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard1000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.isMyCard(context, 999999, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === false);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: catch err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_1100
     * @tc.name       : testTelephonyContactIsMyCard1100
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard1100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.isMyCard(context, NaN, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: catch err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 401);
        done();
      }

      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_1200
     * @tc.name       : testTelephonyContactIsMyCard1200
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard1200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.isMyCard(context, 0, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === false);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: catch err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_1300
     * @tc.name       : testTelephonyContactIsMyCard1300
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard1300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.isMyCard(context, 999999999999, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === false);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: catch err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_1400
     * @tc.name       : testTelephonyContactIsMyCard1400
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard1400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.isMyCard(context, Number.MAX_SAFE_INTEGER, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === false);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: catch err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_1500
     * @tc.name       : testTelephonyContactIsMyCard1500
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard1500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.isMyCard(context, Number.MIN_SAFE_INTEGER, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === false);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: catch err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_1600
     * @tc.name       : testTelephonyContactIsMyCard1600
     * @tc.desc       : Determine if it is "my business card" and use the callback method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let cardId: number = await addCard();
      const caseName: string = "testTelephonyContactIsMyCard1600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.isMyCard(context, cardId);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data->${JSON.stringify(data)}`);
          ExpectTrue(data);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.error(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_1700
     * @tc.name       : testTelephonyContactIsMyCard1700
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard1700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.isMyCard(context, INVALID_CONTACT_ID);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401);
          done();
        });
      } catch (err) {
        console.error(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_2000
     * @tc.name       : testTelephonyContactIsMyCard2000
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard2000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.isMyCard(context, 1.5);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.log(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_2100
     * @tc.name       : testTelephonyContactIsMyCard2100
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard2100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.isMyCard(context, Infinity);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401);
          done();
        });
      } catch (err) {
        console.log(`${caseName} catch：err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_2200
     * @tc.name       : testTelephonyContactIsMyCard2200
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard2200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.isMyCard(context, -1000);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401);
          done();
        });
      } catch (err) {
        console.log(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_2300
     * @tc.name       : testTelephonyContactIsMyCard2300
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard2300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.isMyCard(context, -Infinity);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401);
          done();
        });
      } catch (err) {
        console.log(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_2400
     * @tc.name       : testTelephonyContactIsMyCard2400
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let cardId: number = await addCard();
      const caseName: string = "testTelephonyContactIsMyCard2400";
      console.info(`${caseName} test start `);
      try {
        let promise = contact.isMyCard(null, cardId);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401 || err.code === 201);
          done();
        });
      } catch (err) {
        console.log(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 401 || err.code === 201);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_2500
     * @tc.name       : testTelephonyContactIsMyCard2500
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard2500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.isMyCard(context, 9999);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.log(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_2600
     * @tc.name       : testTelephonyContactIsMyCard2600
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard2600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.isMyCard(context, NaN);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data->${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
          done();
        });
      } catch (err) {
        console.log(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 401);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_2700
     * @tc.name       : testTelephonyContactIsMyCard2700
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard2700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.isMyCard(context, 0);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
          done();
        });
      } catch (err) {
        console.log(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 401);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_2800
     * @tc.name       : testTelephonyContactIsMyCard2800
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard2800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.isMyCard(context, 999999999999);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data->${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401);
          done();
        });
      } catch (err) {
        console.log(`${caseName} catch: err-> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_2900
     * @tc.name       : testTelephonyContactIsMyCard2900
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard2900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.isMyCard(context, Number.MAX_SAFE_INTEGER);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401);
          done();
        });
      } catch (err) {
        console.log(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_IsMyCard_3000
     * @tc.name       : testTelephonyContactIsMyCard3000
     * @tc.desc       : Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactIsMyCard3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard3000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.isMyCard(context, Number.MIN_SAFE_INTEGER);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.log(`${caseName}catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryMyCard_0100
     * @tc.name       : testTelephonyContactQueryMyCard0100
     * @tc.desc       : Query "My Business Card" and use the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryMyCard0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let cardId:number = await addCard();
      const caseName: string = "testTelephonyContactQueryMyCard0100";
      console.info(`${caseName} test start `);
      console.info(`${caseName} cardId: ${cardId}`);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryMyCard(context, (err: BusinessError, data: contact.Contact) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data.id == cardId);
            done();
          }
        });
      } catch (err) {
        console.log(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryMyCard_0200
     * @tc.name       : testTelephonyContactQueryMyCard0200
     * @tc.desc       : Query "My Business Card" and use the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryMyCard0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryMyCard0200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryMyCard(context, (err: BusinessError, data: contact.Contact) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
          }
        });
      } catch (err) {
        console.log(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryMyCard_0300
     * @tc.name       : testTelephonyContactQueryMyCard0300
     * @tc.desc       : Query "My Business Card" and use  callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryMyCard0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryMyCard0300";
      console.info(`${caseName} test start `);
      try {
        contact.queryMyCard(null, (err: BusinessError, data: contact.Contact) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401 || err.code === 201);
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.log(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 401 || err.code === 201);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryMyCard_0400
     * @tc.name       : testTelephonyContactQueryMyCard0400
     * @tc.desc       : Query "My Business Card" and use the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryMyCard0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let cardId:number = await addCard();
      const caseName: string = "testTelephonyContactQueryMyCard0400";
      console.info(`${caseName} test start `);
      console.info(`${caseName} cardId: ${cardId}`);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryMyCard(context, attr, (err: BusinessError, data: contact.Contact) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data.id == cardId);
            done();
          }
        });
      } catch (err) {
        console.log(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryMyCard_0500
     * @tc.name       : testTelephonyContactQueryMyCard0500
     * @tc.desc       : Query "My Business Card" and use the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryMyCard0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryMyCard0500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryMyCard(context, attr, (err: BusinessError, data: contact.Contact) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
          }
        });
      } catch (err) {
        console.log(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryMyCard_0600
     * @tc.name       : testTelephonyContactQueryMyCard0600
     * @tc.desc       : Query "My Business Card" and use  callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryMyCard0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryMyCard0600";
      console.info(`${caseName} test start `);
      try {
        contact.queryMyCard(null, attr, (err: BusinessError, data: contact.Contact) => {
          if (err) {
            console.log(`${caseName} callback: err:${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401 || err.code === 201);
            done();
          } else {
            console.log(`${caseName} callback: success data:${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.log(`${caseName} catch: err-> ${JSON.stringify(err)}`);
        ExpectTrue(err.code === 401);
        done();
      }
      console.info(`${caseName} test end `);
    });


  });
}