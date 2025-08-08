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

export default function QueryByEmailPhoneNumTest() {
  describe('QueryByEmailPhoneNumTest', () => {

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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_0100
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber0100
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber0100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, "13800000000", (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch:err`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_0200
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber0200
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber0200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContactsByPhoneNumber(context, '13900000000', (err: BusinessError, data: contact.Contact[]) => {
          if (err) {
            console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
            ExpectTrue(data.length == 0);
            done();
          }
        });
      } catch (err) {
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })


    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_0300
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber0300
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber0300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.addContact(context, contactData, (err: BusinessError, data: number) => {
              if (err) {
                console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
                ExpectTrue(data > 0);
                contact.queryContactsByPhoneNumber(context, "13800000000", (err: BusinessError, data: contact.Contact[]) => {
                  if (err) {
                    console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                    ExpectTrue(data.length === 2);
                    done();
                  }
                });
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
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_0500
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber0500
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber0500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, '138*', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length == 0);
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_0600
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber0600
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber0600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '+123-456-7890'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(true);
            contact.queryContactsByPhoneNumber(context, '+123-456-7890', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_0700
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber0700
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber0700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '1234'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(true);
            contact.queryContactsByPhoneNumber(context, '1234', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_0800
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber0800
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber0800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '12345678901234567890'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, '12345678901234567890', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_0900
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber0900
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber0900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: 'abc1234565666666'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, 'abc1234565666666', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
              }
            });
          }
        });
      } catch (err) {
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_1000
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber1000
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber1000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '-1'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, '-1', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                done();
              }
            });
          }
        });
      } catch (err) {
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    //---------------------------根据电话号码查询联系人-----QueryContactsByPhoneNumber-----版本10--4个参数----------------
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_1100
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber1100
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContactByPhoneNumber1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber1100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, "13800000000", holder, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_1200
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber1200
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber1200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let holders: contact.Holder = {
              holderId: 1.5,
              bundleName: "",
              displayName: ""
            };
            contact.queryContactsByPhoneNumber(context, '13800000000', holders, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_1300
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber1300
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber1300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let holders: contact.Holder = {
              holderId: 1,
              bundleName: "",
              displayName: ""
            };
            contact.queryContactsByPhoneNumber(context, '13800000000', holders, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_1400
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber1400
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber1400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let holders: contact.Holder = {
              holderId: -11,
              bundleName: "",
              displayName: ""
            };
            contact.queryContactsByPhoneNumber(context, '13800000000', holders, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_1500
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber1500
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber1500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let holders: contact.Holder = {
              holderId: 1,
              bundleName: "com.ohos.contacts",
              displayName: ""
            };
            contact.queryContactsByPhoneNumber(context, '13800000000', holders, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_1600
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber1600
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber1600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let holders: contact.Holder = {
              holderId: 1,
              bundleName: "",
              displayName: "phone"
            };
            contact.queryContactsByPhoneNumber(context, '13800000000', holders, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
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
    })
    //---------------------------根据电话号码查询联系人-----${caseName}-----版本10--4个参数-----arrr属性-----------
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_1800
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber1800
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContactByPhoneNumber1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber1800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(true);
            contact.queryContactsByPhoneNumber(context, '13800000000', holder, attr, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
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
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_2200
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber2200
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber2200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let attrs: contact.ContactAttributes = {
        attributes: [contact.Attribute.ATTR_NOTE, contact.Attribute.ATTR_ORGANIZATION, contact.Attribute.ATTR_PHONE,
        contact.Attribute.ATTR_PORTRAIT, contact.Attribute.ATTR_POSTAL_ADDRESS,
        contact.Attribute.ATTR_RELATION,
        contact.Attribute.ATTR_SIP_ADDRESS, contact.Attribute.ATTR_WEBSITE]
      };
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, '13800000000', attrs, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
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
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_2300
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber2300
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContactByPhoneNumber2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber2300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, '13800000000', holder, attr, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
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
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_2500
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber2500
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber2500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContactsByPhoneNumber(context, '13811111111', holder, attr, (err: BusinessError, data: contact.Contact[]) => {
          if (err) {
            console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
            ExpectTrue(data.length === 0);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_2600
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber2600
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber2600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '-1'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, '-1', holder, attr, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
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
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_2700
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber2700
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber2700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contact.addContact(context, contactData, (err: BusinessError, data: number) => {
        if (err) {
          console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          try {
            let holders: contact.Holder = {
              holderId: -11,
              bundleName: "",
              displayName: "phone"
            };
            contact.queryContactsByPhoneNumber(context, '13800000000', holders, attr, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
              }
            });
          } catch (err) {
            console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          }
        }
      });
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_2800
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber2800
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber2800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let attrs: contact.ContactAttributes = {
              attributes: []
            };
            contact.queryContactsByPhoneNumber(context, '13800000000', holder, attrs, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
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
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_2900
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber2900
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber2900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let attrs: contact.ContactAttributes = {
              attributes: []
            };
            let holders: contact.Holder = {
              holderId: 11,
              bundleName: "",
              displayName: "phone"
            };
            contact.queryContactsByPhoneNumber(context, "13800000000", holders, attrs, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0);
                done();
              }
            });
          }
        });
      } catch (err) {
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_3000
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber3000
     * @tc.desc       : Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber3000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: 'null'
        }]
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let attrs: contact.ContactAttributes = {
              attributes: [contact.Attribute.ATTR_CONTACT_EVENT, contact.Attribute.ATTR_EMAIL,
              contact.Attribute.ATTR_GROUP_MEMBERSHIP]
            };
            contact.queryContactsByPhoneNumber(context, "null", holder, attrs, (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
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
    })

    //---------------------------根据电话号码查询联系人，使用Promise方式作为异步方法----------------

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_3100
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber3100
     * @tc.desc       : Query contacts based on phone numbers and use Promise as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContactByPhoneNumber3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber3100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryContactsByPhoneNumber(context, '13800000000', holder, attr);
            promise.then((data: contact.Contact[]) => {
              console.log(`${caseName} queryContacts:success->----${data}---${JSON.stringify(data)}`);
              ExpectTrue(data.length > 0);
              done();
            }).catch((err: BusinessError) => {
              console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
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
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_3400
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber3400
     * @tc.desc       : Query contacts based on phone numbers and use Promise as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber3400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let holders: contact.Holder = {
              holderId: -11,
              bundleName: "com.ohos.contacts",
              displayName: "phone"
            };
            let promise = contact.queryContactsByPhoneNumber(context, '13800000000', holders, attr);
            promise.then((data: contact.Contact[]) => {
              console.log(`${caseName} queryContacts:success-> ${data.length}--${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
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
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_3500
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber3500
     * @tc.desc       : Query contacts based on phone numbers and use Promise as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber3500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contact.addContact(context, contactData, (err: BusinessError, data: number) => {
        if (err) {
          console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          let holders: contact.Holder = {
            holderId: 0,
            bundleName: "com.ohos.contacts",
            displayName: "phone"
          };
          let promise = contact.queryContactsByPhoneNumber(context, '13800000000', holders, attr);
          promise.then((data: contact.Contact[]) => {
            console.log(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
            ExpectTrue(data.length === 0);
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          });
        }
      });
      console.info(`${caseName} test end `);
    })


    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByPhoneNumber_3600
     * @tc.name       : testTelephonyContactQueryContactByPhoneNumber3600
     * @tc.desc       : Query contacts based on phone numbers and use Promise as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactByPhoneNumber3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber3600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;

      contact.addContact(context, contactData, (err: BusinessError, data: number) => {
        if (err) {
          console.info(`${caseName} addContact:err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact:success->${JSON.stringify(data)}`);
          ExpectTrue(true);
          let holders: contact.Holder = {
            holderId: 2,
            bundleName: "com.ohos.contacts",
            displayName: "phone"
          };
          let promise = contact.queryContactsByPhoneNumber(context, '13800000000', holders, attr);
          promise.then((data: contact.Contact[]) => {
            console.log(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
            ExpectTrue(data.length === 0);
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          });
        }
      });
      console.info(`${caseName} test end `);
    })
  })
}
