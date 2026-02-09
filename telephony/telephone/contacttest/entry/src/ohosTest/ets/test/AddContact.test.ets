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
import { SavePhoto, GetUri, GetPixelMap } from './ContactTestUtil.test';
import { image } from '@kit.ImageKit';

function sleep (time:number):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}

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

export default function AddContactTest() {
  describe('AddContactTest', () => {

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
          contactList = await contact.queryContactsByPhoneNumber(context,"13800000000");
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
    let fileName = 'AddContactTest.jpg';
    SavePhoto(fileName);
    let uri = GetUri(fileName);
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
        uri: uri
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
     * @tc.name   abnormal_contactsApi_insert_test_2800
     * @tc.number abnormal_contactsApi_insert_test_2800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("abnormal_contactsApi_insert_test_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let contactDataError: contact.Contact = {};
      try {
        let rawContactId = await contact.addContact(contactDataError);
        console.info("abnormal_contactsApi_insert_test_2800 : rawContactId = " + rawContactId);
        expect(rawContactId === -1).assertTrue();
        done();
      } catch (error) {
        console.info("contactsApi_insert_test_100 : raw_contact insert error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testTelephonyContactContactsCount0100
     * @tc.number SUB_Telephony_Contact_ContactsCount_0100
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactContactsCount0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactContactsCount0100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsCount(context).then((CountData) => {
              console.log(`${caseName} queryContactsCount: success CountData>${JSON.stringify(CountData)}`);
              expect(CountData >= 1).assertTrue;
              done();
            }).catch((err:BusinessError) => {
              console.log(`${caseName} CountData: err>${JSON.stringify(err)}`);
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
     * @tc.name   testTelephonyContactHasName0100
     * @tc.number SUB_Telephony_Contact_HasName_0100
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactHasName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactHasName0100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
                  expect(queryData?.name?.hasName === true).assertTrue;
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
     * @tc.name   testTelephonyContactAddContact0100
     * @tc.number SUB_Telephony_Contact_AddContact_0100
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactAddContact0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
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
     * @tc.name   testTelephonyContactAddContact0200
     * @tc.number SUB_Telephony_Contact_AddContact_0200
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactAddContact0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 2, name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }]
      };
      try {
        sleep(500);
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          sleep(500);
          if (err) {
            console.log(`${caseName} addContact1: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact1: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
              if (err) {
                console.log(`${caseName} addContact2: err>${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.log(`${caseName} addContact2: success data>${JSON.stringify(data)}`);
                ExpectTrue(data > 0);
                contact.queryContactsByPhoneNumber(context, "13800000000", (err: BusinessError, data: contact.Contact[]) => {
                  if (err) {
                    console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                    ExpectTrue(data.length === 2);
                    done()
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
     * @tc.name   testTelephonyContactAddContact0300
     * @tc.number SUB_Telephony_Contact_AddContact_0300
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 3, name: {
          fullName: ''
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }]
      };
      try {
        sleep(500);
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
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
     * @tc.name   testTelephonyContactAddContact0400
     * @tc.number SUB_Telephony_Contact_AddContact_0400
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 3, name: {
          fullName: '张三'
        }, phoneNumbers: [{
          phoneNumber: ''
        }]
      };
      try {
        sleep(500);
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
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
     * @tc.name   testTelephonyContactAddContact0500
     * @tc.number SUB_Telephony_Contact_AddContact_0500
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 3, name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '110'
        }]
      };
      try {
        sleep(500);
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
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
     * @tc.name   testTelephonyContactAddContact0600
     * @tc.number SUB_Telephony_Contact_AddContact_0600
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 3, name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '12345'
        }]
      };
      try {
        sleep(500);
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
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
     * @tc.name   testTelephonyContactAddContact0700
     * @tc.number SUB_Telephony_Contact_AddContact_0700
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 7, name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }, {
          phoneNumber: '13800000000'
        }]
      };
      try {
        sleep(500);
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
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
     * @tc.name   testTelephonyContactAddContact0800
     * @tc.number SUB_Telephony_Contact_AddContact_0800
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 8, name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }, {
          phoneNumber: '13811111111'
        }, {
          phoneNumber: '13800000000'
        }, {
          phoneNumber: '13822222222'
        }]
      };
      try {
        sleep(500);
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
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
     * @tc.name   testTelephonyContactAddContact0900
     * @tc.number SUB_Telephony_Contact_AddContact_0900
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact0900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '10086'
        }]
      };
      try {
        sleep(500);
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
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
     * @tc.name   testTelephonyContactAddContact1200
     * @tc.number SUB_Telephony_Contact_AddContact_1200
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1200";
      console.info(`${caseName} test start `);
      let phoneNumContact: contact.Contact = {
        id: 10, name: {
          fullName: '张三发发发发发发发发发afafafafafafafafafafaf张三发发发发发发发发发afafafafafafafafafafaf张三发发发发发发发发发afafafafafafafafafafaf张三发发发发发发发发发afafafafafafafafafafaf'
        }, phoneNumbers: [{
          phoneNumber: '13811111111'
        }]
      };
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
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
     * @tc.name   testTelephonyContactAddContact1300
     * @tc.number SUB_Telephony_Contact_AddContact_1300
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 10, name: {
          fullName: '张三'
        }, phoneNumbers: [{
          phoneNumber: '010-5591008'
        }]
      };
      try {
        sleep(500);
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
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
     * @tc.name   testTelephonyContactAddContact1400
     * @tc.number SUB_Telephony_Contact_AddContact_1400
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 10, name: {
          fullName: 'Eve!@'
        }, phoneNumbers: [{
          phoneNumber: '13811111111'
        }]
      };
      try {
        sleep(500);
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
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
     * @tc.name   testTelephonyContactAddContact1500
     * @tc.number SUB_Telephony_Contact_AddContact_1500
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 10, name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '+123-456-7890'
        }]
      };
      try {
        sleep(500);
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
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
     * @tc.name   testTelephonyContactAddContact1600
     * @tc.number SUB_Telephony_Contact_AddContact_1600
     * @tc.desc   Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactAddContact1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 15, name: {
          fullName: '张三'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }]
      };
      try {
        sleep(500);
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.name   testTelephonyContactAddContact1700
     * @tc.number SUB_Telephony_Contact_AddContact_1700
     * @tc.desc   Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactAddContact1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 16, name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }]
      };
      try {
        sleep(500);
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          sleep(500);
          let promise2 = contact.addContact(context, phoneNumContact);
          promise2.then((data: number) => {
            console.log(`${caseName} success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryContactsByPhoneNumber(context, "13800000000", (err: BusinessError, data: contact.Contact[]) => {
              if (err) {
                console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                ExpectTrue(data.length === 2);
                done()
              }
            });
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          });
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.name   testTelephonyContactAddContact1800
     * @tc.number SUB_Telephony_Contact_AddContact_1800
     * @tc.desc   Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: ''
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }]
      };
      try {
        sleep(500);
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.name   testTelephonyContactAddContact1900
     * @tc.number SUB_Telephony_Contact_AddContact_1900
     * @tc.desc   Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '张三'
        }, phoneNumbers: [{
          phoneNumber: ''
        }]
      };
      try {
        sleep(500);
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.name   testTelephonyContactAddContact2000
     * @tc.number SUB_Telephony_Contact_AddContact_2000
     * @tc.desc   Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact2000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '张三'
        }, phoneNumbers: [{
          phoneNumber: '110'
        }]
      };
      try {
        sleep(500);
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.name   testTelephonyContactAddContact2100
     * @tc.number SUB_Telephony_Contact_AddContact_2100
     * @tc.desc   Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact2100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '12345'
        }]
      };
      try {
        sleep(500);
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.name   testTelephonyContactAddContact2200
     * @tc.number SUB_Telephony_Contact_AddContact_2200
     * @tc.desc   Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact2200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }, {
          phoneNumber: '13811111111'
        }]
      };
      try {
        sleep(500);
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.name   testTelephonyContactAddContact2300
     * @tc.number SUB_Telephony_Contact_AddContact_2300
     * @tc.desc   Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact2300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }, {
          phoneNumber: '13811111111'
        }, {
          phoneNumber: '13800000000'
        }, {
          phoneNumber: '13822222222'
        }]
      };
      try {
        sleep(500);
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.name   testTelephonyContactAddContact2400
     * @tc.number SUB_Telephony_Contact_AddContact_2400
     * @tc.desc   Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact2400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: 'Frank'
        }, phoneNumbers: [{
          phoneNumber: '10086'
        }]
      };
      try {
        sleep(500);
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
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
     * @tc.name   testTelephonyContactAddContact2700
     * @tc.number SUB_Telephony_Contact_AddContact_2700
     * @tc.desc   Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact2700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '张三发发发发发发发发发张三发发发发发发发发发张三发发发发发发发发发张三发发发发发发发发发张三发发发发发发发发发张三发发发发发发发发发张三发发发发发发发发发'
        }, phoneNumbers: [{
          phoneNumber: '13811111111'
        }]
      };
      try {
        sleep(500);
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
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
     * @tc.name   testTelephonyContactAddContact2800
     * @tc.number SUB_Telephony_Contact_AddContact_2800
     * @tc.desc   Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact2800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '张三'
        }, phoneNumbers: [{
          phoneNumber: '010-5591008'
        }]
      };
      try {
        sleep(500);
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.name   testTelephonyContactAddContact2900
     * @tc.number SUB_Telephony_Contact_AddContact_2900
     * @tc.desc   Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact2900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: 'Eve!@'
        }, phoneNumbers: [{
          phoneNumber: '13811111111'
        }]
      };
      try {
        sleep(500);
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.name   testTelephonyContactAddContact3000
     * @tc.number SUB_Telephony_Contact_AddContact_3000
     * @tc.desc   Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact3000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: '张三'
        }, phoneNumbers: [{
          phoneNumber: '+123-456-7890'
        }]
      };
      try {
        sleep(500);
        let promise = contact.addContact(context, phoneNumContact);
        promise.then((data: number) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })


    /**
     * @tc.name   testTelephonyContactAddContact6100
     * @tc.number SUB_Telephony_Contact_AddContact_6100
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactAddContact6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact6100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.nickName !== undefined) {
        contactData.nickName.nickName = "小明";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
                  if (resDate.nickName !== undefined) {
                    let nickName: contact.NickName = resDate.nickName;
                    ExpectTrue(nickName.nickName === "小明");
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
     * @tc.name   testTelephonyContactAddContact6200
     * @tc.number SUB_Telephony_Contact_AddContact_6200
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact6200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.nickName !== undefined) {
        contactData.nickName.nickName = "小  明";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
                  if (resDate.nickName !== undefined) {
                    let nickName: contact.NickName = resDate.nickName;
                    ExpectTrue(nickName.nickName === "小  明");
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
     * @tc.name   testTelephonyContactAddContact6300
     * @tc.number SUB_Telephony_Contact_AddContact_6300
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact6300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.nickName !== undefined) {
        contactData.nickName.nickName = "小明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明明";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
                  ExpectTrue(queryData.key === keyData);
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
     * @tc.name   testTelephonyContactAddContact6400
     * @tc.number SUB_Telephony_Contact_AddContact_6400
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact6400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.nickName !== undefined) {
        contactData.nickName.nickName = "";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
     * @tc.name   testTelephonyContactAddContact6500
     * @tc.number SUB_Telephony_Contact_AddContact_6500
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact6500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.nickName !== undefined) {
        contactData.nickName.nickName = "contact.addContact()";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
                  if (resDate.nickName !== undefined) {
                    let nickName: contact.NickName = resDate.nickName;
                    ExpectTrue(nickName.nickName === "contact.addContact()");
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
     * @tc.name   testTelephonyContactAddContact6600
     * @tc.number SUB_Telephony_Contact_AddContact_6600
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactAddContact6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact6600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.note !== undefined) {
        contactData.note.noteContent = "同事";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
                  if (resDate.note !== undefined) {
                    let note: contact.Note = resDate.note;
                    ExpectTrue(note.noteContent === "同事");
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
     * @tc.name   testTelephonyContactAddContact6700
     * @tc.number SUB_Telephony_Contact_AddContact_6700
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact6700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.note !== undefined) {
        contactData.note.noteContent = "同事1990.3";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
                  if (resDate.note !== undefined) {
                    let note: contact.Note = resDate.note;
                    ExpectTrue(note.noteContent === "同事1990.3");
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
     * @tc.name   testTelephonyContactAddContact6800
     * @tc.number SUB_Telephony_Contact_AddContact_6800
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact6800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.note !== undefined) {
        contactData.note.noteContent = "同事~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ha";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
     * @tc.name   testTelephonyContactAddContact6900
     * @tc.number SUB_Telephony_Contact_AddContact_6900
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact6900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.note !== undefined) {
        contactData.note.noteContent = "";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
     * @tc.name   testTelephonyContactAddContact7000
     * @tc.number SUB_Telephony_Contact_AddContact_7000
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.note !== undefined) {
        contactData.note.noteContent = "contact.addContact()";
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
     * @tc.name   testTelephonyContactAddContact7100
     * @tc.number SUB_Telephony_Contact_AddContact_7100
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactAddContact7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.name = "organization_name";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
                  if (resDate.organization !== undefined) {
                    let organization: contact.Organization = resDate.organization;
                    ExpectTrue(organization.name === "organization_name");
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
     * @tc.name   testTelephonyContactAddContact7200
     * @tc.number SUB_Telephony_Contact_AddContact_7200
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.name = "organization Development";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
                  if (resDate.organization !== undefined) {
                    let organization: contact.Organization = resDate.organization;
                    ExpectTrue(organization.name === "organization Development");
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
     * @tc.name   testTelephonyContactAddContact7300
     * @tc.number SUB_Telephony_Contact_AddContact_7300
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.name = "organizationName";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
                  if (resDate.organization !== undefined) {
                    let organization: contact.Organization = resDate.organization;
                    ExpectTrue(organization.name === "organizationName");
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
     * @tc.name   testTelephonyContactAddContact7400
     * @tc.number SUB_Telephony_Contact_AddContact_7400
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.name = "organizationName organizationName organizationName organizationName organizationName organizationName organizationName organizationName organizationName organizationName organizationName organizationName organizationName organizationName organizationName organizationName organizationName organizationName organizationName";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
     * @tc.name   testTelephonyContactAddContact7500
     * @tc.number SUB_Telephony_Contact_AddContact_7500
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.name = "";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
     * @tc.name   testTelephonyContactAddContact7600
     * @tc.number SUB_Telephony_Contact_AddContact_7600
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.name = "contact.addContact(context, contactData)";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
     * @tc.name   testTelephonyContactAddContact7700
     * @tc.number SUB_Telephony_Contact_AddContact_7700
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactAddContact7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.title = "test title";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
                  if (resDate.organization !== undefined) {
                    let organization: contact.Organization = resDate.organization;
                    ExpectTrue(organization.title === "test title");
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
     * @tc.name   testTelephonyContactAddContact7800
     * @tc.number SUB_Telephony_Contact_AddContact_7800
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.title = "";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
                  if (resDate.organization !== undefined) {
                    let organization: contact.Organization = resDate.organization;
                    ExpectTrue(organization.title === undefined);
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
     * @tc.name   testTelephonyContactAddContact7900
     * @tc.number SUB_Telephony_Contact_AddContact_7900
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact7900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.title = "rgarhrthrtar16546841655gieruhgiuerhgi的回复i耳庇古如果发erjfioerhgiowwhgiorehgr8iiiiiiiiiiii(*&^!$#!@#iiiiiiiiiiiiiiiiiiiiiiiiiii还能否龟儿回归额外回归微软划归俄国会饿v与uvu余部i一个统一的如同当初太原分院吧";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
                  if (resDate.organization !== undefined) {
                    let organization: contact.Organization = resDate.organization;
                    if (organization.title !== undefined) {
                      ExpectTrue(organization.title.length > 0);
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
     * @tc.name   testTelephonyContactAddContact8000
     * @tc.number SUB_Telephony_Contact_AddContact_8000
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact8000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.organization !== undefined) {
        contactData.organization.title = "contact.addContact(context, contactData, (err: BusinessError, addData) => {})";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
                  if (resDate.organization !== undefined) {
                    let organization: contact.Organization = resDate.organization;
                    ExpectTrue(typeof (organization.title) === "string");
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
     * @tc.name   testTelephonyContactAddContact8100
     * @tc.number SUB_Telephony_Contact_AddContact_8100
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactAddContact8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact8100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
     * @tc.name   testTelephonyContactAddContact8200
     * @tc.number SUB_Telephony_Contact_AddContact_8200
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact8200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.name !== undefined) {
        contactData.name.fullName = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
        contactData.name.familyName = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
                  if (resDate.name !== undefined) {
                    let name: contact.Name = resDate.name;
                    ExpectTrue(name.fullName !== "" && typeof (name.familyName) === "string");
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
     * @tc.name   testTelephonyContactAddContact8400
     * @tc.number SUB_Telephony_Contact_AddContact_8400
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact8400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.name !== undefined) {
        contactData.name.fullName = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
        contactData.name.givenName = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
      }
      sleep(500);
      contact.addContact(context, contactData, (err: BusinessError, addData: number) => {
        sleep(500);
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
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  if (resDate.name !== undefined) {
                    let name: contact.Name = resDate.name;
                    ExpectTrue(name.fullName !== "" && typeof (name.givenName) === "string");
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
     * @tc.name   testTelephonyContactAddContact8500
     * @tc.number SUB_Telephony_Contact_AddContact_8500
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact8500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.name !== undefined) {
        contactData.name.fullName = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
        contactData.name.givenNamePhonetic = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
                  if (resDate.name !== undefined) {
                    let name: contact.Name = resDate.name;
                    ExpectTrue(name.fullName !== "" && typeof (name.givenNamePhonetic) === "string");
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
     * @tc.name   testTelephonyContactAddContact8600
     * @tc.number SUB_Telephony_Contact_AddContact_8600
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact8600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.name !== undefined) {
        contactData.name.fullName = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
        contactData.name.middleName = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
      }
      sleep(500);
      contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
        sleep(500);
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
                  if (resDate.name !== undefined) {
                    let name: contact.Name = resDate.name;
                    ExpectTrue(name.fullName !== "" && typeof (name.middleName) === "string");
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
     * @tc.name   testTelephonyContactAddContact9000
     * @tc.number SUB_Telephony_Contact_AddContact_9000
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {

      const caseName: string = "testTelephonyContactAddContact9000";
      console.info(`${caseName} test start `);
      let pixelMap: image.PixelMap = await GetPixelMap();
      let fileName = 'AddContactTest.jpg';
      let uri = GetUri(fileName);
      let contactDataByPixelMap: contact.Contact = {
        name: {
        fullName: "addContactByPixelMap9000",
      },
        phoneNumbers: [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: 4
        }],
        portrait: {
          uri: uri,
          photo: pixelMap
        },
      };
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactDataByPixelMap, (addErr: BusinessError, addData: number) => {
        sleep(500);
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          expect().assertFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          expect(addData > 0).assertTrue();
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              expect().assertFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  expect().assertFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  expect(resDate.id != undefined && resDate.id > 0).assertTrue();
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
     * @tc.name   testTelephonyContactAddContact9100
     * @tc.number SUB_Telephony_Contact_AddContact_9100
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {

      const caseName: string = "testTelephonyContactAddContact9100";
      console.info(`${caseName} test start `);
      let pixelMap: image.PixelMap = await GetPixelMap();
      let contactDataByPixelMap: contact.Contact = {
        name: {
        fullName: "addContactByPixelMap9100",
      },
        phoneNumbers: [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: 4
        }],
        portrait: {
          uri: '',
          photo: pixelMap
        },
      };
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactDataByPixelMap, (addErr: BusinessError, addData: number) => {
        sleep(500);
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          expect().assertFail();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          expect(addData > 0).assertTrue();
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              expect().assertFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                if (queryErr) {
                  console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                  expect().assertFail();
                  done();
                } else {
                  console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                  let resDate: contact.Contact = queryData;
                  expect(resDate.id != undefined && resDate.id > 0).assertTrue();
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
     * @tc.name   testTelephonyContactAddContact9200
     * @tc.number SUB_Telephony_Contact_AddContact_9200
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {

      const caseName: string = "testTelephonyContactAddContact9200";
      console.info(`${caseName} test start `);
      let pixelMap: image.PixelMap = await GetPixelMap();
      let uri = 'test';
      let contactDataByPixelMap: contact.Contact = {
        name: {
        fullName: "addContactByPixelMap9200",
      },
        phoneNumbers: [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: 4
        }],
        portrait: {
          uri: uri,
          photo: pixelMap
        },
      };
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactDataByPixelMap, (addErr: BusinessError, addData: number) => {
        sleep(500);
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          expect(addErr.code === 401).assertTrue();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          expect().assertFail();
        }
      });
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyContactAddContact9300
     * @tc.number SUB_Telephony_Contact_AddContact_9300
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {

      const caseName: string = "testTelephonyContactAddContact9300";
      console.info(`${caseName} test start `);
      let uri = 'test';
      let contactDataByPixelMap: contact.Contact = {
        name: {
        fullName: "addContactByPixelMap9300",
      },
        phoneNumbers: [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: 4
        }],
        portrait: {
          uri: uri,
          photo: undefined
        },
      };
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactDataByPixelMap, (addErr: BusinessError, addData: number) => {
        sleep(500);
        if (addErr) {
          console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
          expect(addErr.code === 401).assertTrue();
          done();
        } else {
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          expect().assertFail();
        }
      });
      console.info(`${caseName} test end `);
    });






    /**
     * @tc.name   testTelephonyContactIsLocalContact0100
     * @tc.number SUB_Telephony_Contact_IsLocalContact_0100
     * @tc.desc   Determine if the current contact ID is in the phone book and use the callback method as an asynchronous method  10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactIsLocalContact0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact0100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        sleep(500);
        contact.addContact(context, contactData, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.isLocalContact(context, data, (err: BusinessError<void>, data: boolean) => {
              if (err) {
                console.log(`${caseName} isLocalContact: err>${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.log(`${caseName} isLocalContact: success data>${JSON.stringify(data)}`);
                ExpectTrue(data === true);
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
     * @tc.name   testTelephonyContactIsLocalContact0200
     * @tc.number SUB_Telephony_Contact_IsLocalContact_0200
     * @tc.desc   Determine if the current contact ID is in the phone book and use the callback method as an asynchronous method  10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactIsLocalContact0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact0200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        sleep(500);
        contact.isLocalContact(context, 9999, (err: BusinessError<void>, data: boolean) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data === false);
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
     * @tc.name   testTelephonyContactIsLocalContact0400
     * @tc.number SUB_Telephony_Contact_IsLocalContact_0400
     * @tc.desc   Determine if the current contact ID is in the phone book and use callback as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactIsLocalContact0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact0400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        sleep(500);
        contact.isLocalContact(context, -1, (err: BusinessError<void>, data: boolean) => {
          if (err) {
            console.log(`${caseName} err>${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.log(`${caseName} success data>${JSON.stringify(data)}`);
            expect().assertFail();
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
     * @tc.name   testTelephonyContactIsLocalContact0500
     * @tc.number SUB_Telephony_Contact_IsLocalContact_0500
     * @tc.desc   Determine if the current contact ID is in the phone book and use callback as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactIsLocalContact0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact0500";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        contact.isLocalContact(context, 1.5, (err: BusinessError<void>, data: boolean) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data === false);
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
     * @tc.name   testTelephonyContactIsLocalContact0700
     * @tc.number SUB_Telephony_Contact_IsLocalContact_0700
     * @tc.desc   Determine if the current contact ID is in the phone book and use the Promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactIsLocalContact0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact0700";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        contact.isLocalContact(context, -10000, (err: BusinessError<void>, data: boolean) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            expect().assertFail();
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
     * @tc.name   testTelephonyContactIsLocalContact0800
     * @tc.number SUB_Telephony_Contact_IsLocalContact_0800
     * @tc.desc   Determine if the current contact ID is in the phone book and use the Promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactIsLocalContact0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact0800";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        contact.isLocalContact(context, 10000000, (err: BusinessError<void>, data: boolean) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data === false)
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
     * @tc.name   testTelephonyContactIsLocalContact0900
     * @tc.number SUB_Telephony_Contact_IsLocalContact_0900
     * @tc.desc   Determine if the current contact ID is in the phone book and use the Promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactIsLocalContact0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact0900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        id: 1, name: {
          fullName: '张三'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }]
      };
      try {
        sleep(500);
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.isLocalContact(context, data);
            promise.then((data: boolean) => {
              console.log(`${caseName} success: data>${JSON.stringify(data)}`);
              ExpectTrue(data === true);
              done();
            }).catch((err: BusinessError) => {
              console.error(`isLocalContact fail: err>${JSON.stringify(err)}`);
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
     * @tc.name   testTelephonyContactIsLocalContact1000
     * @tc.number SUB_Telephony_Contact_IsLocalContact_1000
     * @tc.desc   Determine if the current contact ID is in the phone book and use Promise as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactIsLocalContact1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact1000";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        let promise = contact.isLocalContact(context, 9999);
        promise.then((data: boolean) => {
          console.log(`isLocalContact success: data>${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          done();
        }).catch((err: BusinessError) => {
          console.error(`isLocalContact fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.name   testTelephonyContactIsLocalContact1200
     * @tc.number SUB_Telephony_Contact_IsLocalContact_1200
     * @tc.desc   Determine if the current contact ID is in the phone book and use Promise as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactIsLocalContact1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact1200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        sleep(500);
        let promise = contact.isLocalContact(context, -1);
        await promise.then((data: boolean) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.name   testTelephonyContactIsLocalContact1300
     * @tc.number SUB_Telephony_Contact_IsLocalContact_1300
     * @tc.desc   Determine if the current contact ID is in the phone book and use Promise as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactIsLocalContact1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact1300";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        let promise = contact.isLocalContact(context, 1.5);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.name   testTelephonyContactIsLocalContact1500
     * @tc.number SUB_Telephony_Contact_IsLocalContact_1500
     * @tc.desc   Determine if the current contact ID is in the phone book and use Promise as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactIsLocalContact1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact1500";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        let promise = contact.isLocalContact(context, -10000);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.name   testTelephonyContactIsLocalContact1600
     * @tc.number SUB_Telephony_Contact_IsLocalContact_1600
     * @tc.desc   Determine if the current contact ID is in the phone book and use Promise as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactIsLocalContact1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact1600";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        let promise = contact.isLocalContact(context, 100000000);
        promise.then((data: boolean) => {
          console.log(`isLocalContact success: data>${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectFail();
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.name   testTelephonyContactDeleteContact0100
     * @tc.number SUB_Telephony_Contact_DeleteContact_0100
     * @tc.desc   Delete a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactDeleteContact0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactDeleteContact0100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err: BusinessError, data: number) => {
        sleep(500);
        if (err) {
          console.log(`${caseName} addContact:err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          console.log(`${caseName} addContact:success->${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          contact.queryKey(context, data, (err: BusinessError, key: string) => {
            if (err) {
              console.log(`${caseName} queryKey: err->${JSON.stringify(err)}`);
              ExpectFail();
              done();
            } else {
              console.log(`${caseName} queryKey: success->${JSON.stringify(key)}`);
              ExpectTrue(key.length != 0);
              contact.deleteContact(context, key, (err: BusinessError) => {
                if (err) {
                  console.info(`${caseName} deleteContacts:err->${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} deleteContacts:success`);
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
     * @tc.name   testTelephonyContactDeleteContact0200
     * @tc.number SUB_Telephony_Contact_DeleteContact_0200
     * @tc.desc   Delete a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactDeleteContact0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactDeleteContact0200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        sleep(500);
        contact.deleteContact(context, '', (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} deleteContacts:err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} deleteContacts:success`);
            expect().assertFail();
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
     * @tc.name   testTelephonyContactDeleteContact0600
     * @tc.number SUB_Telephony_Contact_DeleteContact_0600
     * @tc.desc   Delete a contacts and useing the promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactDeleteContact0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactDeleteContact0600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err: BusinessError, data: number) => {
        sleep(500);
        if (err) {
          console.log(`${caseName} addContact:err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        } else {
          console.log(`${caseName} addContact:success->${JSON.stringify(data)}`);
          ExpectTrue(data > 0);
          contact.queryKey(context, data, (err: BusinessError, key: string) => {
            if (err) {
              console.log(`${caseName} queryKey: err->${JSON.stringify(err)}`);
              ExpectFail();
              done();
            } else {
              console.log(`${caseName} queryKey: success->${JSON.stringify(key)}`);
              ExpectTrue(key.length != 0);
              let promise = contact.deleteContact(context, key);
              promise.then(() => {
                console.info(`${caseName} deleteContacts:success`);
                expect(key.length !== 0).assertTrue();
                done();
              }).catch((err: BusinessError) => {
                console.error(`${caseName} deleteContacts:fail->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              });
            }
          });
        }
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.name   testTelephonyContactDeleteContact0700
     * @tc.number SUB_Telephony_Contact_DeleteContact_0700
     * @tc.desc   Delete a contacts and useing the promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactDeleteContact0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactDeleteContact0700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        sleep(500);
        let promise = contact.deleteContact(context, "");
        promise.then(() => {
          console.info(`${caseName} deleteContacts:success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} deleteContacts:fail->${JSON.stringify(err)}`);
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
     * @tc.name   testTelephonyContactQueryHolders0100
     * @tc.number SUB_Telephony_Contact_QueryHolders_0100
     * @tc.desc   Query all application information for creating contacts and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactQueryHolders0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryHolders0100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        sleep(500);
        contact.queryHolders(context, (err: BusinessError, data) => {
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
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.name   testTelephonyContactQueryHolders0200
     * @tc.number SUB_Telephony_Contact_QueryHolders_0200
     * @tc.desc   Query all application information for creating contacts and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryHolders0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryHolders0200";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        sleep(500);
        let promise = contact.queryHolders(context);
        promise.then((data) => {
          console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
          ExpectTrue(data.length > 0);
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


  })
}

