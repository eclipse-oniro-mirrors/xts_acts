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

import { describe, beforeAll, afterEach, it, expect, beforeEach } from '@ohos/hypium'
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

export default function QueryByEmailTest() {
  describe('QueryByEmailTest', () => {

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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_0100
     * @tc.name       : testTelephonyContactQueryContactsByEmail0100
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContactsByEmail0100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail0100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryContactsByEmail: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContactsByEmail: success data->${JSON.stringify(data)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_0200
     * @tc.name       : testTelephonyContactQueryContactsByEmail0200
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail0200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail0200";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, '13811111111@email.com', (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_0300
     * @tc.name       : testTelephonyContactQueryContactsByEmail0300
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail0300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail0300";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, '12!@#895@email.com', (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_0500
     * @tc.name       : testTelephonyContactQueryContactsByEmail0500
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail0500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail0500";
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
            contact.addContact(context, contactData, (err: BusinessError, data: number) => {
              if (err) {
                console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
                ExpectTrue(data > 0);
                contact.queryContactsByEmail(context, '13800000000@email.com', (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} queryContactsByEmail: err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContactsByEmail: success data->${data.length}--${JSON.stringify(data)}`);
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
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_0600
     * @tc.name       : testTelephonyContactQueryContactsByEmail0600
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail0600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail0600";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, 'local_part_max_length64_characters@domain_part_max_length255_characters.com', (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success  data->${JSON.stringify(data)}`);
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
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_0700
     * @tc.name       : testTelephonyContactQueryContactsByEmail0700
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail0700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail0700";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', holder, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryContactsByEmail: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContactsByEmail: success data->${JSON.stringify(data)}`);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_0800
     * @tc.name       : testTelephonyContactQueryContactsByEmail0800
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail0800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail0800";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', {
              holderId: -5,
              bundleName: "",
              displayName: ""
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_0900
     * @tc.name       : testTelephonyContactQueryContactsByEmail0900
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail0900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail0900";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1000
     * @tc.name       : testTelephonyContactQueryContactsByEmail1000
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1000";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, '123!@#456@email.com', holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1100
     * @tc.name       : testTelephonyContactQueryContactsByEmail1100
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, '123456', holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1300
     * @tc.name       : testTelephonyContactQueryContactsByEmail1300
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1300";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, '123456', {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1400
     * @tc.name       : testTelephonyContactQueryContactsByEmail1400
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1400";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, '000000@email.com', holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1500
     * @tc.name       : testTelephonyContactQueryContactsByEmail1500
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1500";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', attr, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1700
     * @tc.name       : testContactQueryContactsByEmail017
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1700";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '123456', {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(true);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1800
     * @tc.name       : testTelephonyContactQueryContactsByEmail1800
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1800";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '123456@email.com', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1900
     * @tc.name       : testTelephonyContactQueryContactsByEmail1900
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1900";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '123456@email.com', {
              holderId: 1,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2000
     * @tc.name       : testTelephonyContactQueryContactsByEmail2000
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2000";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '123456@email.com', {
              holderId: -1,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2100
     * @tc.name       : testTelephonyContactQueryContactsByEmail2100
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '0000@email.com', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2200
     * @tc.name       : testTelephonyContactQueryContactsByEmail2200
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2200";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '123!@#456@email.com', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2300
     * @tc.name       : testTelephonyContactQueryContactsByEmail2300
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2300";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '123455', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2400
     * @tc.name       : testTelephonyContactQueryContactsByEmail2400
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2400";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByEmail(context, '000000@email.com', {
              holderId: 1,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2500
     * @tc.name       : testTelephonyContactQueryContactsByEmail2500
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2500";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryContactsByEmail(context, '123456@email.com', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2600
     * @tc.name       : testTelephonyContactQueryContactsByEmail2600
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2600";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryContactsByEmail(context, '123456@email.com', {
              holderId: 1,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2700
     * @tc.name       : testTelephonyContactQueryContactsByEmail2700
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2700";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryContactsByEmail(context, '123456@email.com', {
              holderId: -5,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2800
     * @tc.name       : testTelephonyContactQueryContactsByEmail2800
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2800";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryContactsByEmail(context, '00000@email.com', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_2900
     * @tc.name       : testTelephonyContactQueryContactsByEmail2900
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail2900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail2900";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryContactsByEmail(context, '123!@#456@email.com', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_3000
     * @tc.name       : testTelephonyContactQueryContactsByEmail3000
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail3000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail3000";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryContactsByEmail(context, '3698', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_3100
     * @tc.name       : testTelephonyContactQueryContactsByEmail3100
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail3100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail3100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryContactsByEmail(context, '000000@email.com', {
              holderId: 1,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_3300
     * @tc.name       : testTelephonyContactQueryContactsByEmail3300
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail3300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail3300";
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
            contact.queryContactsByEmail(context, '897452455', (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });



    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_3700
     * @tc.name       : testTelephonyContactQueryContactsByEmail3700
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail3700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail3700";
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
            contact.queryContactsByEmail(context, '555555', attr, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_3900
     * @tc.name       : testTelephonyContactQueryContactsByEmail3900
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail3900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail3900";
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
            contact.queryContactsByEmail(context, '666666', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
    });



    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_4100
     * @tc.name       : testTelephonyContactQueryContactsByEmail4100
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail4100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail4100";
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
            let promise = contact.queryContactsByEmail(context, '123214', {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_4200
     * @tc.name       : testTelephonyContactQueryContactsByEmail4200
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContactsByEmail4200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail4200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let phoneNumContact: contact.Contact = {
          id: 1,
          emails: [{
            email: '13800000000@email.com',
            labelName: "自定义邮箱",
            labelId: contact.Email.EMAIL_HOME,
            displayName: "emailDisplayName"
          }],
        };
        contact.addContact(context, phoneNumContact, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                if (data[0].emails !== undefined) {
                  if (data[0].emails[0].labelId !== undefined) {
                    ExpectTrue(data[0].emails[0].displayName === "emailDisplayName");
                    done();
                  }
                } else {
                  ExpectFail();
                  done();
                }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_4300
     * @tc.name       : testTelephonyContactQueryContactsByEmail4300
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail4300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail4300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let phoneNumContact: contact.Contact = {
          id: 1,
          emails: [{
            email: '13800000000@email.com',
            labelName: "自定义邮箱",
            labelId: contact.Email.EMAIL_HOME,
            displayName: "emailDisplayName"
          }],
        };
        contact.addContact(context, phoneNumContact, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                if (data[0].emails !== undefined) {
                  if (data[0].emails[0].labelId !== undefined) {
                    ExpectTrue(data[0].emails[0].labelName === "自定义邮箱");
                    done();
                  }
                } else {
                  ExpectFail();
                  done();
                }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_4400
     * @tc.name       : testTelephonyContactQueryContactsByEmail4400
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail4400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail4400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let phoneNumContact: contact.Contact = {
          id: 1,
          emails: [{
            email: '13800000000@email.com',
            labelName: "自定义邮箱",
            labelId: contact.Email.EMAIL_HOME,
            displayName: "emailDisplayName"
          }],
        };
        contact.addContact(context, phoneNumContact, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                let queryData: contact.Contact[] = data
                if (queryData[0].emails !== undefined) {
                  let queryEmail: contact.Email[] = queryData[0].emails
                  if (queryEmail[0].labelId !== undefined) {
                    ExpectTrue(queryEmail[0].labelId.toString() === "1");
                    done();
                  }
                } else {
                  ExpectFail();
                  done();
                }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_4500
     * @tc.name       : testTelephonyContactQueryContactsByEmail4500
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail4500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail4500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.postalAddresses =
      [{
        city: "南京",
        country: "中国",
        labelName: "labelName",
        neighborhood: "neighborhood",
        pobox: "pobox",
        postalAddress: "postalAddress",
        postcode: "postcode",
        region: "region",
        street: "street",
        labelId: contact.PostalAddress.ADDR_OTHER
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.postalAddresses !== undefined) {
                      let PostalAddress: contact.PostalAddress[] = resDate.postalAddresses;
                      if (PostalAddress[0].labelId !== undefined) {
                        ExpectTrue(PostalAddress[0].labelId.toString() === "3");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_4700
     * @tc.name       : testTelephonyContactQueryContactsByEmail4700
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail4700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail4700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.postalAddresses =
      [{
        city: "南京",
        country: "中国",
        labelName: "labelName",
        neighborhood: "neighborhood",
        pobox: "pobox",
        postalAddress: "postalAddress",
        postcode: "postcode",
        region: "region",
        street: "street",
        labelId: contact.PostalAddress.ADDR_OTHER
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.postalAddresses !== undefined) {
                      let PostalAddress: contact.PostalAddress[] = resDate.postalAddresses;
                      if (PostalAddress[0].labelName !== undefined) {
                        ExpectTrue(PostalAddress[0].labelName === "labelName");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_4900
     * @tc.name       : testTelephonyContactQueryContactsByEmail4900
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail4900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail4900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.postalAddresses =
      [{
        city: "南京",
        country: "中国",
        labelName: "labelName",
        neighborhood: "neighborhood",
        pobox: "pobox",
        postalAddress: "postalAddress",
        postcode: "postcode",
        region: "region",
        street: "street",
        labelId: contact.PostalAddress.ADDR_OTHER
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.postalAddresses !== undefined) {
                      let PostalAddress: contact.PostalAddress[] = resDate.postalAddresses;
                      if (PostalAddress[0].pobox !== undefined) {
                        ExpectTrue(PostalAddress[0].pobox === "pobox");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_5000
     * @tc.name       : testTelephonyContactQueryContactsByEmail5000
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail5000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail5000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.postalAddresses =
      [{
        city: "南京",
        country: "中国",
        labelName: "labelName",
        neighborhood: "neighborhood",
        pobox: "pobox",
        postalAddress: "postalAddress",
        postcode: "postcode",
        region: "region",
        street: "street",
        labelId: contact.PostalAddress.ADDR_OTHER
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.postalAddresses !== undefined) {
                      let PostalAddress: contact.PostalAddress[] = resDate.postalAddresses;
                      if (PostalAddress[0].postalAddress !== undefined) {
                        ExpectTrue(PostalAddress[0].postalAddress === "postalAddress");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_5100
     * @tc.name       : testTelephonyContactQueryContactsByEmail5100
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail5100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail5100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.postalAddresses =
      [{
        city: "南京",
        country: "中国",
        labelName: "labelName",
        neighborhood: "neighborhood",
        pobox: "pobox",
        postalAddress: "postalAddress",
        postcode: "postcode",
        region: "region",
        street: "street",
        labelId: contact.PostalAddress.ADDR_OTHER
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.postalAddresses !== undefined) {
                      let PostalAddress: contact.PostalAddress[] = resDate.postalAddresses;
                      if (PostalAddress[0].postcode !== undefined) {
                        ExpectTrue(PostalAddress[0].postcode === "postcode");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_5200
     * @tc.name       : testTelephonyContactQueryContactsByEmail5200
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail5200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail5200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.postalAddresses =
      [{
        city: "南京",
        country: "中国",
        labelName: "labelName",
        neighborhood: "neighborhood",
        pobox: "pobox",
        postalAddress: "postalAddress",
        postcode: "postcode",
        region: "region",
        street: "street",
        labelId: contact.PostalAddress.ADDR_OTHER
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.postalAddresses !== undefined) {
                      let PostalAddress: contact.PostalAddress[] = resDate.postalAddresses;
                      if (PostalAddress[0].region !== undefined) {
                        ExpectTrue(PostalAddress[0].region === "region");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_5300
     * @tc.name       : testTelephonyContactQueryContactsByEmail5300
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail5300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail5300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.postalAddresses =
      [{
        city: "南京",
        country: "中国",
        labelName: "labelName",
        neighborhood: "neighborhood",
        pobox: "pobox",
        postalAddress: "postalAddress",
        postcode: "postcode",
        region: "region",
        street: "street",
        labelId: contact.PostalAddress.ADDR_OTHER
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.postalAddresses !== undefined) {
                      let PostalAddress: contact.PostalAddress[] = resDate.postalAddresses;
                      if (PostalAddress[0].street !== undefined) {
                        ExpectTrue(PostalAddress[0].street === "street");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_5400
     * @tc.name       : testTelephonyContactQueryContactsByEmail5400
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail5400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail5400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let phoneNumContact: contact.Contact = {
          id: 1,
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
            labelId: contact.PostalAddress.ADDR_OTHER
          }],
          emails: [{
            email: "13800000000@email.com",
            labelName: "自定义邮箱",
            labelId: contact.Email.EMAIL_HOME,
            displayName: "emailDisplayName"
          }],
        };
        contact.addContact(context, phoneNumContact, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryContactsByEmail(context, '13800000000@email.com', (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                if (data[0].emails !== undefined) {
                  if (data[0].emails[0].labelId !== undefined) {
                    ExpectTrue(data[0].emails[0].labelId.toString() === "1");
                    done();
                  }
                }
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_5500
     * @tc.name       : testTelephonyContactQueryContactsByEmail5500
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail5500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail5500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.postalAddresses =
      [{
        city: "南京",
        country: "中国",
        labelName: "labelName",
        neighborhood: "neighborhood",
        pobox: "pobox",
        postalAddress: "postalAddress",
        postcode: "postcode",
        region: "region",
        street: "street",
        labelId: contact.PostalAddress.ADDR_OTHER
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.postalAddresses !== undefined) {
                      let PostalAddress: contact.PostalAddress[] = resDate.postalAddresses;
                      if (PostalAddress[0].labelId !== undefined) {
                        ExpectTrue(PostalAddress[0].labelId.toString() === "3");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  }
                });
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_5700
     * @tc.name       : testTelephonyContactQueryContactsByEmail5700
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail5700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail5700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.sipAddresses =
      [{
        sipAddress: "sipAddress", labelName: "自定义sipAddress", labelId: contact.PostalAddress.ADDR_HOME
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} callback: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(keyData)}`);
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.sipAddresses !== undefined) {
                      let SipAddress: contact.SipAddress[] = resDate.sipAddresses;
                      if (SipAddress[0].labelId !== undefined) {
                        ExpectTrue(SipAddress[0].labelId.toString() === "1");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
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
    });





  })
}