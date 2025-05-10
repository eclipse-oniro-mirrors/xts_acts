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
import { Driver } from '@ohos.UiTest';

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
}

export default function QueryKeyTest() {
  describe('QueryKeyTest', () => {

    beforeAll(async (done: Function) => {
      console.info("beforeAll case");
      await getPermissions();
      done();
    });

    afterEach(async (done: Function) => {
      try {
        let context: Context = AppStorage.get('context') as Context;
        let contactList: contact.Contact[] = [];
        try {
          contactList = await contact.queryContacts(context);
        } catch (queryErr) {
          console.info(`afterEach queryContacts catch err: ${JSON.stringify(queryErr)}`);
          done();
        }
        try {
          if (contactList.length > 0) {
            contactList.forEach(async (item: contact.Contact) => {
              if (item.key) {
                await contact.deleteContact(context, item.key);
                console.info(`afterEach deleteContact success--${item.key}`);
              }
            })
          }
          done();
        } catch (deleteErr) {
          console.info(`afterEach deleteContact catch err: ${JSON.stringify(deleteErr)}`);
          done();
        }
      } catch (error) {
        console.info(`afterEach catch error: ${JSON.stringify(error)}`);
        done();
      }
    });

    let contactData: contact.Contact = {
      id: 0,
      key: "0",
      contactAttributes: {
        attributes: [contact.Attribute.ATTR_CONTACT_EVENT, contact.Attribute.ATTR_EMAIL,
        contact.Attribute.ATTR_GROUP_MEMBERSHIP,
        contact.Attribute.ATTR_IM, contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_NICKNAME,
        contact.Attribute.ATTR_NOTE, contact.Attribute.ATTR_ORGANIZATION, contact.Attribute.ATTR_PHONE,
        contact.Attribute.ATTR_PORTRAIT, contact.Attribute.ATTR_POSTAL_ADDRESS,
        contact.Attribute.ATTR_RELATION,
        contact.Attribute.ATTR_SIP_ADDRESS, contact.Attribute.ATTR_WEBSITE]
      },
      emails: [{
        email: "13800000000@email.com", labelName: "自定义邮箱", labelId: 1, displayName: "emailDisplayName"
      }],
      events: [{
        eventDate: "event", labelName: "自定义event", labelId: 2
      }],
      groups: [{
        groupId: 1, title: "群组"
      }],
      imAddresses: [{
        imAddress: "imAddress", labelName: "自定义", labelId: 3
      }],
      phoneNumbers: [{
        phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: 4
      }],
      portrait: {
        uri: "content://head/0"
      },
      postalAddresses: [{
        city: "南京",
        country: "中国",
        labelName: "labelName",
        neighborhood: "neighborhood",
        pobox: "pobox",
        postalAddress: "postalAddress",
        postcode: "postcode",
        region: "region",
        street: "street",
        labelId: 5
      }],
      relations: [{
        relationName: "relationName", labelName: "自定义relationName", labelId: 6
      }],
      sipAddresses: [{
        sipAddress: "sipAddress", labelName: "自定义sipAddress", labelId: 6
      }],
      websites: [{
        website: "website"
      }],
      name: {
        familyName: "familyName",
        familyNamePhonetic: "familyNamePhonetic",
        fullName: "小李",
        givenName: "givenName",
        givenNamePhonetic: "givenNamePhonetic",
        middleName: "middleName",
        middleNamePhonetic: "middleNamePhonetic",
        namePrefix: "namePrefix",
        nameSuffix: "nameSuffix"
      },
      nickName: {
        nickName: "nickName"
      },
      note: {
        noteContent: "note"
      },
      organization: {
        name: "TT", title: "开发"
      }
    };

    let holder: contact.Holder = {
      holderId: 1,
      bundleName: "com.ohos.contacts",
      displayName: "phone"
    };

    let attr: contact.ContactAttributes = {
      attributes: [
      contact.Attribute.ATTR_CONTACT_EVENT,
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
      contact.Attribute.ATTR_WEBSITE
      ]
    };

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0100
     * @tc.name       : testTelephonyContactQueryKey0100
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryKey0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryKey(context,
              data, (err: BusinessError, data) => {
                if (err) {
                  console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                  ExpectTrue(data.length > 0);
                  done();
                }
              });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0200
     * @tc.name       : testTelephonyContactQueryKey0200
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, -1, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0300
     * @tc.name       : testTelephonyContactQueryKey0300
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, 1.5, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0400
     * @tc.name       : testTelephonyContactQueryKey0400
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, 999999999999999999999999999999999999999, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0500
     * @tc.name       : testTelephonyContactQueryKey0500
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryKey0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryKey(context, data, holder, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0600
     * @tc.name       : testTelephonyContactQueryKey0600
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryKey(context, data, {
              holderId: 1,
              bundleName: "",
              displayName: ""
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0700
     * @tc.name       : testTelephonyContactQueryKey0700
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryKey(context, data, {
              holderId: 10,
              bundleName: "bundle",
              displayName: "display"
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data === undefined);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0800
     * @tc.name       : testTelephonyContactQueryKey0800
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, 56987151545665656565656565, holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_0900
     * @tc.name       : testTelephonyContactQueryKey0900
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey0900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, -1, holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1000
     * @tc.name       : testTelephonyContactQueryKey1000
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, 1.5, holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1100
     * @tc.name       : testTelephonyContactQueryKey1100
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, -10000, {
          holderId: -1.5,
          bundleName: "bundle",
          displayName: "display"
        }, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1200
     * @tc.name       : testTelephonyContactQueryKey1200
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, Number.MAX_VALUE, holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1300
     * @tc.name       : testTelephonyContactQueryKey1300
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryKey(context, data, {
              holderId: 1000000,
              bundleName: "bundle",
              displayName: "display"
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data === undefined);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1400
     * @tc.name       : testTelephonyContactQueryKey1400
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryKey(context, data, holder);
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length > 0);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1500
     * @tc.name       : testTelephonyContactQueryKey1500
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryKey(context, data, {
              holderId: -1,
              bundleName: "",
              displayName: ""
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data === undefined);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
              ExpectTrue(err.code === 401);
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1600
     * @tc.name       : testTelephonyContactQueryKey1600
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryKey(context, data, {
              holderId: -10,
              bundleName: "bundle",
              displayName: "display"
            });
            promise.then((data) => {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
              ExpectTrue(data === undefined);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
              ExpectTrue(err.code === 401);
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1700
     * @tc.name       : testTelephonyContactQueryKey1700
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.queryKey(context, 564654156215646541561, holder);
        promise.then((data) => {
          console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
          ExpectTrue(data === undefined);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1800
     * @tc.name       : testTelephonyContactQueryKey1800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.queryKey(context, -1, holder);
        promise.then((data) => {
          console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
          ExpectTrue(data === undefined);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_1900
     * @tc.name       : testTelephonyContactQueryKey1900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey1900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.queryKey(context, 1.5, holder);
        promise.then((data) => {
          console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
          ExpectTrue(data === undefined);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_2000
     * @tc.name       : testTelephonyContactQueryKey2000
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey2000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryKey(context, -1, {
          holderId: -1,
          bundleName: "ddd",
          displayName: "www",
        }, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data === undefined);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_2100
     * @tc.name       : testTelephonyContactQueryKey2100
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey2100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.queryKey(context, Number.MAX_VALUE, holder);
        promise.then((data) => {
          console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
          ExpectTrue(data === undefined);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_2200
     * @tc.name       : testTelephonyContactQueryKey2200
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryKey2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey2200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryKey(context, data, {
              holderId: 100000000000000,
              bundleName: "bundle",
              displayName: "display"
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data === undefined);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
              ExpectTrue(err.code === 401);
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    // 7版本
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryKey_2300
     * @tc.name       : testTelephonyContactQueryKey2300
     * @tc.desc       : Query the key of a contact based on their ID and use the callback method as an asynchronous method. (deprecated)7+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryKey2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey2300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryKey(context,
              data, (err: BusinessError, data) => {
                if (err) {
                  console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                  ExpectTrue(data.length > 0);
                  done();
                }
              });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });




  })
}