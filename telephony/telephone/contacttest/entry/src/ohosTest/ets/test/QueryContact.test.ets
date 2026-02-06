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

export default function QueryContactTest() {
  describe('QueryContactTest', () => {

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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_0100
     * @tc.name       : testTelephonyContactQueryContact0100
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContact0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact0100";
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
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.queryContact(context, data, (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                    ExpectTrue(data !== undefined);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_0300
     * @tc.name       : testTelephonyContactQueryContact0300
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact0300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, "12333", (err: BusinessError, data: contact.Contact) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_0400
     * @tc.name       : testTelephonyContactQueryContact0400
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact0400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, '!@#abc', (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_0500
     * @tc.name       : testTelephonyContactQueryContact0500
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact0500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, 'null', (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_0600
     * @tc.name       : testTelephonyContactQueryContact0600
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact0600";
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
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.queryContact(context, data, holder, (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                    ExpectTrue(data !== undefined);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_0800
     * @tc.name       : testTelephonyContactQueryContact0800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact0800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, 'xxxx', holder, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_0900
     * @tc.name       : testTelephonyContactQueryContact0900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact0900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, '!@#abc', holder, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_1000
     * @tc.name       : testTelephonyContactQueryContact1000
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, 'null', holder, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_1100
     * @tc.name       : testTelephonyContactQueryContact1100
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1100";
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
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.queryContact(context, data, {
                  holderId: 1.1,
                  bundleName: "",
                  displayName: ""
                }, (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} queryContact: err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContact: success data->${JSON.stringify(data)}`);
                    ExpectTrue(data !== undefined);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_1200
     * @tc.name       : testTelephonyContactQueryContact1200
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1200";
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
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.queryContact(context, data, {
                  holderId: -100000,
                  bundleName: "",
                  displayName: ""
                }, (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} queryContact: err->${JSON.stringify(err)}`);
                    ExpectTrue(err.code === 401);
                    done();
                  } else {
                    console.info(`${caseName} queryContact: success data->${JSON.stringify(data)}`);
                    ExpectTrue(data === undefined);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_1300
     * @tc.name       : testTelephonyContactQueryContact1300
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1300";
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
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.queryContact(context, data, attr, (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} queryContact: err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContact: success data->${JSON.stringify(data)}`);
                    ExpectTrue(data !== undefined);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_1500
     * @tc.name       : testTelephonyContactQueryContact1500
     * @tc.desc       : Query the key of a contact based on their ID and use the Callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, 'xxx', attr, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_1600
     * @tc.name       : testTelephonyContactQueryContact1600
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, '!@#abc', attr, (err: BusinessError, data) => {
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
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_1700
     * @tc.name       : testTelephonyContactQueryContact1700
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, 'null', attr, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_1800
     * @tc.name       : testTelephonyContactQueryContact1800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1800";
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
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.queryContact(context, data, holder, attr, (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} queryContact: err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContact: success data->${JSON.stringify(data)}`);
                    ExpectTrue(data !== undefined);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2000
     * @tc.name       : testTelephonyContactQueryContact2000
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, 'xxxx', holder, attr, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2100
     * @tc.name       : testTelephonyContactQueryContact2100
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, 'null', holder, attr, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2200
     * @tc.name       : testTelephonyContactQueryContact2200
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, '!@#abc', holder, {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        }, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2300
     * @tc.name       : testTelephonyContactQueryContact2300
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2300";
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
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.queryContact(context, data, {
                  holderId: 1.1,
                  bundleName: "",
                  displayName: ""
                }, attr, (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} queryContact: err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContact: success data->${JSON.stringify(data)}`);
                    ExpectTrue(data !== undefined);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2400
     * @tc.name       : testTelephonyContactQueryContact2400
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2400";
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
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.queryContact(context, data, {
                  holderId: -10000000,
                  bundleName: "",
                  displayName: ""
                }, attr, (err: BusinessError, data) => {
                  if (err) {
                    console.info(`${caseName} queryContact: err->${JSON.stringify(err)}`);
                    ExpectTrue(err.code === 401);
                    done();
                  } else {
                    console.info(`${caseName} queryContact: success data->${JSON.stringify(data)}`);
                    ExpectTrue(data === undefined);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2500
     * @tc.name       : testTelephonyContactQueryContact2500
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContact(context, 'sdfafasfafdafasfasfasfasfasfafafafafafsaf', holder, {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        }, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2600
     * @tc.name       : testTelephonyContactQueryContact2600
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2600";
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
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                let promise = contact.queryContact(context, data, holder, attr);
                promise.then((data) => {
                  console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                  ExpectTrue(data !== undefined);
                  done();
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2800
     * @tc.name       : testTelephonyContactQueryContact2800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.queryContact(context, 'xxxx', holder, {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        });
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_2900
     * @tc.name       : testTelephonyContactQueryContact2900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.queryContact(context, '!@#abc', holder, attr);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3000
     * @tc.name       : testTelephonyContactQueryContact3000
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.queryContact(context, 'null', holder, attr);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3100
     * @tc.name       : testTelephonyContactQueryContact3100
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3100";
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
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                let promise = contact.queryContact(context, data, {
                  holderId: 1.1,
                  bundleName: "",
                  displayName: ""
                }, attr);
                promise.then((data) => {
                  console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                  ExpectTrue(data !== undefined);
                  done();
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3200
     * @tc.name       : testTelephonyContactQueryContact3200
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3200";
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
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                let promise = contact.queryContact(context, data, {
                  holderId: -100,
                  bundleName: "",
                  displayName: ""
                }, attr);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3300
     * @tc.name       : testTelephonyContactQueryContact3300
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.emails = [{
        email: "13800000000@email.com",
        labelName: "家庭地址类型",
        labelId: contact.Email.EMAIL_HOME,
        displayName: "emailDisplayName"
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} callback: success data->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.emails !== undefined) {
                      let email: contact.Email[] = resDate.emails;
                      if (email[0].labelId !== undefined) {
                        ExpectTrue(email[0].labelId.toString() === "1");
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

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3400
     * @tc.name       : testTelephonyContactQueryContact3400
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.emails = [{
        email: "13800000000@email.com",
        labelName: "工作地址类型",
        labelId: contact.Email.EMAIL_WORK,
        displayName: "emailDisplayName"
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.emails !== undefined) {
                      if (queryData.emails[0].labelId !== undefined) {
                        ExpectTrue(queryData.emails[0].labelId.toString() === "2");
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
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3500
     * @tc.name       : testTelephonyContactQueryContact3500
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.emails = [{
        email: "13800000000@email.com",
        labelName: "其它地址类型",
        labelId: contact.Email.EMAIL_OTHER,
        displayName: "emailDisplayName"
      }];
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
            contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
              if (keyErr) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.emails !== undefined) {
                      if (queryData.emails[0].labelId !== undefined) {
                        ExpectTrue(queryData.emails[0].labelId.toString() === "3");
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
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3600
     * @tc.name       : testTelephonyContactQueryContact3600
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "自定义关系类型", labelId: contact.Relation.CUSTOM_LABEL
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "0");
                        done();
                      }
                      ;
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
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3700
     * @tc.name       : testTelephonyContactQueryContact3700
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "助手关系类型", labelId: contact.Relation.RELATION_ASSISTANT
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "1");
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
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3800
     * @tc.name       : testTelephonyContactQueryContact3800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "兄弟关系类型", labelId: contact.Relation.RELATION_BROTHER
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "2");
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
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_3900
     * @tc.name       : testTelephonyContactQueryContact3900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact3900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "子女关系类型", labelId: contact.Relation.RELATION_CHILD
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "3");
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
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4000
     * @tc.name       : testTelephonyContactQueryContact4000
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "合作伙伴关系类型", labelId: contact.Relation.RELATION_DOMESTIC_PARTNER
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "4");
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
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4100
     * @tc.name       : testTelephonyContactQueryContact4100
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "父亲关系类型", labelId: contact.Relation.RELATION_FATHER
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "5");
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
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4200
     * @tc.name       : testTelephonyContactQueryContact4200
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4200";
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "朋友关系类型", labelId: contact.Relation.RELATION_FRIEND
      }];
      console.info(`${caseName} test start `);
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "6");
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
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4300
     * @tc.name       : testTelephonyContactQueryContact4300
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "管理者关系类型", labelId: contact.Relation.RELATION_MANAGER
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "7");
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
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4400
     * @tc.name       : testTelephonyContactQueryContact4400
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "母亲关系类型", labelId: contact.Relation.RELATION_MOTHER
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "8");
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
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4500
     * @tc.name       : testTelephonyContactQueryContact4500
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "父母关系类型", labelId: contact.Relation.RELATION_PARENT
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "9");
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
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4600
     * @tc.name       : testTelephonyContactQueryContact4600
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "同居同伴关系类型", labelId: contact.Relation.RELATION_PARTNER
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "10");
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
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4700
     * @tc.name       : testTelephonyContactQueryContact4700
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "推荐人关系类型", labelId: contact.Relation.RELATION_REFERRED_BY
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "11");
                        done();
                      }
                      ;
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


    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4800
     * @tc.name       : testTelephonyContactQueryContact4800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "亲属关系类型", labelId: contact.Relation.RELATION_RELATIVE
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "12");
                        done();
                      }
                      ;
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

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_4900
     * @tc.name       : testTelephonyContactQueryContact4900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact4900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "姐妹关系类型", labelId: contact.Relation.RELATION_SISTER
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "13");
                        done();
                      }
                      ;
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

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5000
     * @tc.name       : testTelephonyContactQueryContact5000
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "配偶关系类型", labelId: contact.Relation.RELATION_SPOUSE
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.relations !== undefined) {
                      if (queryData.relations[0].labelId !== undefined) {
                        ExpectTrue(queryData.relations[0].labelId.toString() === "14");
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

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5200
     * @tc.name       : testTelephonyContactQueryContact5200
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.sipAddresses = [{
        sipAddress: "sipAddress", labelName: "自定义会话发起协议（SIP）地址类型", labelId: contact.SipAddress.CUSTOM_LABEL
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.sipAddresses !== undefined) {
                      if (queryData.sipAddresses[0].labelId !== undefined) {
                        ExpectTrue(queryData.sipAddresses[0].labelId.toString() === "0");
                        done();
                      }
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
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5300
     * @tc.name       : testTelephonyContactQueryContact5300
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.sipAddresses = [{
        sipAddress: "sipAddress", labelName: "家庭会话发起协议（SIP）地址类型", labelId: contact.SipAddress.SIP_HOME
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.sipAddresses !== undefined) {
                      if (queryData.sipAddresses[0].labelId !== undefined) {
                        ExpectTrue(queryData.sipAddresses[0].labelId.toString() === "1");
                        done();
                      }
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
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5400
     * @tc.name       : testTelephonyContactQueryContact5400
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.sipAddresses = [{
        sipAddress: "sipAddress", labelName: "工作会话发起协议（SIP）地址类型", labelId: contact.SipAddress.SIP_WORK
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.sipAddresses !== undefined) {
                      if (queryData.sipAddresses[0].labelId !== undefined) {
                        ExpectTrue(queryData.sipAddresses[0].labelId.toString() === "2");
                        done();
                      }
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
    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5500
     * @tc.name       : testTelephonyContactQueryContact5500
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.sipAddresses = [{
        sipAddress: "sipAddress", labelName: "其它会话发起协议（SIP）地址类型", labelId: contact.SipAddress.SIP_OTHER
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
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    if (queryData.sipAddresses !== undefined) {
                      if (queryData.sipAddresses[0].labelId !== undefined) {
                        ExpectTrue(queryData.sipAddresses[0].labelId.toString() === "3");
                        done();
                      }
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

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5700
     * @tc.name       : testTelephonyContactQueryContact5700
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 1,
        emails: [{
          email: '13800000000@email.com',
          labelName: "自定义邮箱",
          labelId: contact.Email.EMAIL_HOME,
          displayName: "emailDisplayName"
        }],
      };
      try {
        contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
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
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                if (data[0].emails !== undefined) {
                  if (data[0].emails[0].displayName !== undefined) {
                    ExpectTrue(data[0].emails[0].displayName === "emailDisplayName");
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5800
     * @tc.name       : testTelephonyContactQueryContact5800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5800";
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
            contact.queryContact(context, '-1', (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5900
     * @tc.name       : testTelephonyContactQueryContact5900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5900";
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
            contact.queryContact(context, '-1', {
              holderId: -1,
              bundleName: "",
              displayName: ""
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_6000
     * @tc.name       : testTelephonyContactQueryContact6000
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact6000";
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
            contact.queryContact(context, '-1', {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
            }, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_6100
     * @tc.name       : testTelephonyContactQueryContact6100
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact6100";
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
            contact.queryKey(context, data, (err: BusinessError, data) => {
              if (err) {
                console.log(`${caseName} queryKey callback: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.log(`${caseName} queryKey callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.queryContact(context, data, {
                  holderId: -1,
                  bundleName: "err",
                  displayName: ""
                }, attr, (err: BusinessError, data: contact.Contact ) => {
                  if (err) {
                    console.info(`${caseName} callback: queryContact err->${JSON.stringify(err)}`);
                    ExpectTrue(err.code === 401);
                    done();
                  } else {
                    console.info(`${caseName} callback: queryContact success data->${JSON.stringify(data)}`);
                    ExpectTrue(data === undefined);
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_6200
     * @tc.name       : testTelephonyContactQueryContact6200
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact6200";
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
            let promise = contact.queryContact(context, '-1', {
              holderId: -1,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
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
     * @tc.number : SUB_Telephony_Contact_QueryContact_9000
     * @tc.name   : testTelephonyContactQueryContact9000
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress", labelName: "自定义即时消息类型", labelId: contact.ImAddress.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelId !== undefined) {
                      let labelId: number = imAddresses[0].labelId
                      ExpectTrue(labelId.toString() === "-1");
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
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9100
     * @tc.name   : testTelephonyContactQueryContact9100
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress", labelName: "AIM即时消息类型", labelId: contact.ImAddress.IM_AIM
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelId !== undefined) {
                      let labelId: number = imAddresses[0].labelId
                      ExpectTrue(labelId.toString() === "-1");
                    }
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9200
     * @tc.name   : testTelephonyContactQueryContact9200
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress", labelName: "MSN即时消息类型", labelId: contact.ImAddress.IM_MSN
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelId !== undefined) {
                      let labelId: number = imAddresses[0].labelId
                      ExpectTrue(labelId.toString() === "1");
                      done();
                    }
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9300
     * @tc.name   : testTelephonyContactQueryContact9300
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress", labelName: "YAHOO即时消息类型", labelId: contact.ImAddress.IM_YAHOO
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelId !== undefined) {
                      let labelId: number = imAddresses[0].labelId
                      ExpectTrue(labelId.toString() === "2");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9400
     * @tc.name   : testTelephonyContactQueryContact9400
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress", labelName: "SKYPE即时消息类型", labelId: contact.ImAddress.IM_SKYPE
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelId !== undefined) {
                      let labelId: number = imAddresses[0].labelId
                      ExpectTrue(labelId.toString() === "3");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9500
     * @tc.name   : testTelephonyContactQueryContact9500
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress", labelName: "QQ即时消息类型", labelId: contact.ImAddress.IM_QQ
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelId !== undefined) {
                      let labelId: number = imAddresses[0].labelId
                      ExpectTrue(labelId.toString() === "4");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9600
     * @tc.name   : testTelephonyContactQueryContact9600
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress", labelName: "ICQ即时消息类型", labelId: contact.ImAddress.IM_ICQ
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelId !== undefined) {
                      let labelId: number = imAddresses[0].labelId
                      ExpectTrue(labelId.toString() === "6");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9700
     * @tc.name   : testTelephonyContactQueryContact9700
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress", labelName: "JABBER即时消息类型", labelId: contact.ImAddress.IM_JABBER
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
        ExpectTrue(addData > 0);
        contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
          if (keyErr) {
            console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
            ExpectFail();
            done();
          }
          console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
          contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
            if (queryErr) {
              console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
              ExpectFail();
              done();
            }
            console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
            let resDate: contact.Contact = queryData;
            if (resDate.imAddresses !== undefined) {
              let imAddresses: contact.ImAddress[] = resDate.imAddresses;
              if (imAddresses[0].labelId !== undefined) {
                let labelId: number = imAddresses[0].labelId
                ExpectTrue(labelId.toString() === "7");
                done();
              }
            } else {
              ExpectFail();
              done();
            }
          });
        });
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9800
     * @tc.name   : testTelephonyContactQueryContact9800
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress", labelName: "无效的即时消息类型", labelId: contact.ImAddress.INVALID_LABEL_ID
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelId !== undefined) {
                      let labelId: number = imAddresses[0].labelId
                      ExpectTrue(labelId.toString() === "-2");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_9900
     * @tc.name   : testTelephonyContactQueryContact9900
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyContactQueryContact9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact9900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    let imAddress: string = imAddresses[0].imAddress;
                    ExpectTrue(typeof (imAddress) === "string");
                    done();
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
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10000
     * @tc.name   : testTelephonyContactQueryContact10000
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact10000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "", labelName: "自定义即时消息类型", labelId: contact.ImAddress.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    let imAddress: string = imAddresses[0].imAddress;
                    ExpectTrue(typeof (imAddress) === "string");
                    done();
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
      console.info(`${caseName} test end `);
    });
    // --------------------------------------------contact_attribute_imAddresses_imAddress-------参数为超长字符串----------------;
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10100
     * @tc.name   : testTelephonyContactQueryContact10100
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型",
          labelName: "自定义即时消息类型",
          labelId: contact.ImAddress.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    let imAddress: string = imAddresses[0].imAddress;
                    ExpectTrue(typeof (imAddress) === "string");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10200
     * @tc.name   : testTelephonyContactQueryContact10200
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "(*￣︶￣)",
          labelName: "自定义即时消息类型",
          labelId: contact.ImAddress.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    let imAddress: string = imAddresses[0].imAddress;
                    ExpectTrue(typeof (imAddress) === "string");
                    done();
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10300
     * @tc.name   : testTelephonyContactQueryContact10300
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testTelephonyContactQueryContact10300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  ExpectTrue(true);
                  done();
                }
              });
            }
          });
        }
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10500
     * @tc.name   : testTelephonyContactQueryContact10500
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact10500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "自定义即时消息类型",
          labelName: "自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型自定义即时消息类型",
          labelId: contact.ImAddress.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelName !== undefined) {
                      let labelName: string = imAddresses[0].labelName;
                      ExpectTrue(typeof (labelName) === "string");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10600
     * @tc.name   : testTelephonyContactQueryContact10600
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact10600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "自定义即时消息类型",
          labelName: "(*￣︶￣)",
          labelId: contact.ImAddress.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.imAddresses !== undefined) {
                    let imAddresses: contact.ImAddress[] = resDate.imAddresses;
                    if (imAddresses[0].labelName !== undefined) {
                      let labelName: string = imAddresses[0].labelName;
                      ExpectTrue(typeof (labelName) === "string");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10700
     * @tc.name   : testTelephonyContactQueryContact10700
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact10700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "0");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10800
     * @tc.name   : testTelephonyContactQueryContact10800
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact10800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_HOME
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "1");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_10900
     * @tc.name   : testTelephonyContactQueryContact10900
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact10900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_MOBILE
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "2");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11000
     * @tc.name   : testTelephonyContactQueryContact11000
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_WORK
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "3");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11100
     * @tc.name   : testTelephonyContactQueryContact11100
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_FAX_WORK
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "4");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11200
     * @tc.name   : testTelephonyContactQueryContact11200
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_FAX_HOME
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "5");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11300
     * @tc.name   : testTelephonyContactQueryContact11300
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_PAGER
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "6");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11400
     * @tc.name   : testTelephonyContactQueryContact11400
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_OTHER
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "7");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11500
     * @tc.name   : testTelephonyContactQueryContact11500
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_CALLBACK
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "8");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11600
     * @tc.name   : testTelephonyContactQueryContact11600
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_CAR
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "9");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11700
     * @tc.name   : testTelephonyContactQueryContact11700
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_COMPANY_MAIN
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "10");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11800
     * @tc.name   : testTelephonyContactQueryContact11800
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_ISDN
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "11");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_11900
     * @tc.name   : testTelephonyContactQueryContact11900
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact11900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact11900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_MAIN
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "12");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_12000
     * @tc.name   : testTelephonyContactQueryContact12000
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_OTHER_FAX
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "13");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_12100
     * @tc.name   : testTelephonyContactQueryContact12100
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_RADIO
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "14");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_12200
     * @tc.name   : testTelephonyContactQueryContact12200
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_TELEX
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "15");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_12300
     * @tc.name   : testTelephonyContactQueryContact12300
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_TTY_TDD
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "16");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_12400
     * @tc.name   : testTelephonyContactQueryContact12400
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_WORK_MOBILE
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "17");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_12500
     * @tc.name   : testTelephonyContactQueryContact12500
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_WORK_PAGER
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "18");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_12600
     * @tc.name   : testTelephonyContactQueryContact12600
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_ASSISTANT
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "19");
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
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_12700
     * @tc.name   : testTelephonyContactQueryContact12700
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.NUM_MMS
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelId !== undefined) {
                      let labelId: number = phoneNumbers[0].labelId
                      ExpectTrue(labelId.toString() === "20");
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
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_13000
     * @tc.name   : testTelephonyContactQueryContact13000
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact13000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact13000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000",
          labelName: "gbjdsgbfsdbjbfj收到回复i士大夫也是个不服输发表12334!#$%^%^&&^%%$@!#contact.queryKey()",
          labelId: contact.PhoneNumber.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    if (phoneNumbers[0].labelName !== undefined) {
                      let labelName: string = phoneNumbers[0].labelName;
                      ExpectTrue(labelName.length > 0);
                      done();
                    }
                  } else {
                    ExpectFail();
                    done();
                  }
                  done();
                }
              });
            }
          });
        }
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_13100
     * @tc.name   : testTelephonyContactQueryContact13100
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact13100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact13100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "110", labelName: "labelName", labelId: contact.PhoneNumber.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          ExpectFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    let phoneNumber: string = phoneNumbers[0].phoneNumber;
                    ExpectTrue(phoneNumber === "110");
                    done();
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
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number : SUB_Telephony_Contact_QueryContact_13200
     * @tc.name   : testTelephonyContactQueryContact13200
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact13200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact13200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "029-1234567", labelName: "labelName", labelId: contact.PhoneNumber.CUSTOM_LABEL
        }];
      }
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        if (addErr) {
          console.info(`${caseName} callback: err->${JSON.stringify(addErr)}`);
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
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} callback: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.phoneNumbers !== undefined) {
                    let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers;
                    let phoneNumber: string = phoneNumbers[0].phoneNumber;
                    ExpectTrue(phoneNumber === "029-1234567");
                    done();
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
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_0100
     * @tc.name       : testTelephonyContactQueryContacts0100
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContacts0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts0100";
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
            contact.queryContacts(context, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_0300
     * @tc.name       : testTelephonyContactQueryContacts0300
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts0300";
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
            contact.queryContacts(context, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_0400
     * @tc.name       : testTelephonyContactQueryContacts0400
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts0400";
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
            contact.queryContacts(context, {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_0600
     * @tc.name       : testTelephonyContactQueryContacts0600
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts0600";
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
            contact.queryContacts(context, {
              holderId: 1,
              bundleName: "",
              displayName: ""
            }, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_0700
     * @tc.name       : testTelephonyContactQueryContacts0700
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts0700";
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
            contact.queryContacts(context, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
            }, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_0900
     * @tc.name       : testTelephonyContactQueryContacts0900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts0900";
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
            contact.queryContacts(context, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
            }, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_1000
     * @tc.name       : testTelephonyContactQueryContacts1000
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1000";
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
            contact.queryContacts(context, {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_1200
     * @tc.name       : testTelephonyContactQueryContacts1200
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1200";
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
            contact.queryContacts(context, {
              holderId: 1,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
            }, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_1300
     * @tc.name       : testTelephonyContactQueryContacts1300
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1300";
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
            let promise = contact.queryContacts(context, {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_1500
     * @tc.name       : testTelephonyContactQueryContacts1500
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1500";
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
            let promise = contact.queryContacts(context, {
              holderId: 0,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_1600
     * @tc.name       : testTelephonyContactQueryContacts1600
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1600";
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
            contact.queryContacts(context, (err: BusinessError, data) => {
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_1700
     * @tc.name       : testTelephonyContactQueryContacts1700
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1700";
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
            contact.queryContacts(context, {
              holderId: -1,
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_1800
     * @tc.name       : testTelephonyContactQueryContacts1800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1800";
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
            contact.queryContacts(context, {
              holderId: -1,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_1900
     * @tc.name       : testTelephonyContactQueryContacts1900
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContacts1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1900";
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
            let promise = contact.queryContacts(context, {
              holderId: -1,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_3700
     * @tc.name       : testTelephonyContactQueryContacts3700
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContacts3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts3700";
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
            contact.queryContacts(context, {
              holderId: -10000,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
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
     * @tc.number     : SUB_Telephony_Contact_QueryContacts_3800
     * @tc.name       : testTelephonyContactQueryContacts3800
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactQueryContacts3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts3800";
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
            let promise = contact.queryContacts(context, {
              holderId: -10,
              bundleName: "",
              displayName: ""
            }, {
              attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
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
     * @tc.number     : SUB_Telephony_Contact_QueryGroups_0300
     * @tc.name       : testTelephonyContactQueryGroups0300
     * @tc.desc       : Query all groups of contacts and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryGroups0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryGroups0300";
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
            contact.queryGroups(context, {
              holderId: 0.5,
              bundleName: "",
              displayName: ""
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 0)
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
     * @tc.number     : SUB_Telephony_Contact_QueryGroups_0600
     * @tc.name       : testTelephonyContactQueryGroups0600
     * @tc.desc       : Query all groups of contacts and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryGroups0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryGroups0600";
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
            let promise = contact.queryGroups(context, {
              holderId: 19999999999999,
              bundleName: "",
              displayName: ""
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length === 0)
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
  });
}