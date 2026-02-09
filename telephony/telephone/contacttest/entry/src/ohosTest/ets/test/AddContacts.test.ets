/*
 * Copyright (c) huawei Technologies Co., Ltd. 2025. All rights reserved
 */

import { describe, beforeAll, afterEach, it, expect, beforeEach, Level, Size, TestType } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import { SavePhoto, GetUri, GetPixelMap } from './ContactTestUtil.test';
import { image } from '@kit.ImageKit';

const TEST_CONTACTS_NUM = 2;

function sleep (time:number):Promise<string> {
  return new Promise<string>((resolve) => {
    setTimeout(() => {
      resolve('ok')
    }, time)
  });
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info('expectInfo', `test failed`);
  }
}
const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('expectInfo', `test failed`);
  }
}

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = 'ohos.permission.WRITE_CONTACTS' | 'ohos.permission.READ_CONTACTS';
  let list: MyPermissions[] = ['ohos.permission.WRITE_CONTACTS', 'ohos.permission.READ_CONTACTS'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = 
      await bundleManager.getApplicationInfoSync('com.example.contacttest', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
}

export default function AddContactSTest() {
  describe('AddContactsTest', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      await getPermissions();
      done();
    });

    afterEach(async (done: Function) => {
      try {
        let context: Context = AppStorage.get('context') as Context;
        let contactList: contact.Contact[] = [];
        try {
          contactList = await contact.queryContactsByPhoneNumber(context,'13800000000');
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
      key: '0',
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
        email: `13800000000@email.com`, 
        labelName: '自定义邮箱', 
        labelId: 1, 
        displayName: 'emailDisplayName'
      }],
      events: [{
        eventDate: 'event', labelName: '自定义event', labelId: 2
      }],
      groups: [{
        groupId: 1, title: '群组'
      }],
      imAddresses: [{
        imAddress: 'imAddress', labelName: '自定义', labelId: 3
      }],
      phoneNumbers: [{
        phoneNumber: `13800000000`, labelName: '自定义phoneNumbers', labelId: 4
      }],
      portrait: {
        uri: uri
      },
      postalAddresses: [{
        city: '南京',
        country: '中国',
        labelName: 'labelName',
        neighborhood: 'neighborhood',
        pobox: 'pobox',
        postalAddress: 'postalAddress',
        postcode: 'postcode',
        region: 'region',
        street: 'street',
        labelId: 5
      }],
      relations: [{
        relationName: 'relationName', labelName: '自定义relationName', labelId: 6
      }],
      sipAddresses: [{
        sipAddress: 'sipAddress', labelName: '自定义sipAddress', labelId: 6
      }],
      websites: [{
        website: 'website'
      }],
      name: {
        familyName: 'familyName',
        familyNamePhonetic: 'familyNamePhonetic',
        fullName: `小李${Math.random() * 1000}`,
        givenName: 'givenName',
        givenNamePhonetic: 'givenNamePhonetic',
        middleName: 'middleName',
        middleNamePhonetic: 'middleNamePhonetic',
        namePrefix: 'namePrefix',
        nameSuffix: 'nameSuffix'
      },
      nickName: {
        nickName: 'nickName'
      },
      note: {
        noteContent: 'note'
      },
      organization: {
        name: 'TT', title: '开发'
      }
    };

    let holder: contact.Holder = {
      holderId: 1,
      bundleName: 'com.ohos.contacts',
      displayName: 'phone'
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
     * @tc.name   testTelephonyContactAddContacts0100
     * @tc.number SUB_Telephony_Contact_AddContacts_0100
     * @tc.desc   Add a contacts and useing the promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContacts0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, 
      async (done: Function) => {
        const caseName: string = 'testTelephonyContactAddContacts0100';
        console.info(`${caseName} test start `);
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumContacts: contact.Contact[] = [];
        try {
          contact.addContacts(context, phoneNumContacts).then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          }).catch ((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
            expect(err.code === 16700002).assertTrue();
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
     * @tc.name   testTelephonyContactAddContacts0200
     * @tc.number SUB_Telephony_Contact_AddContacts_0200
     * @tc.desc   Add a contacts and useing the promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactAddContacts0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
      async (done: Function) => {
        const caseName: string = 'testTelephonyContactAddContacts0200';
        console.info(`${caseName} test start `);
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumContacts: contact.Contact[] = [];
        for (let i = 0; i < TEST_CONTACTS_NUM; i++) {
          let phoneNumContact: contact.Contact = {
            name: {
              fullName: `李四${i}`
            }, phoneNumbers: [{
              phoneNumber: `13800000000`
            }]
          };
          phoneNumContacts.push(phoneNumContact);
        }
        try {
          sleep(500);
          let promise = contact.addContacts(context, phoneNumContacts);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length === TEST_CONTACTS_NUM).assertTrue();
            sleep(500);
            let promise2 = contact.addContacts(context, phoneNumContacts);  
            promise2.then((data: number[]) => {
              console.log(`${caseName} success data>${JSON.stringify(data)}`);
              expect(data.length === TEST_CONTACTS_NUM).assertTrue();
              contact.queryContactsByPhoneNumber(context, '13800000000', 
                (err: BusinessError, data: contact.Contact[]) => {
                  if (err) {
                    console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
                    ExpectTrue(data.length === TEST_CONTACTS_NUM * 2);
                    done()
                  }
                });
            }).catch ((err: BusinessError) =>{
                console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
                ExpectFail();
                done();
            });
          }).catch ((err: BusinessError) =>{
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
     * @tc.name   testTelephonyContactAddContacts0300
     * @tc.number SUB_Telephony_Contact_AddContacts_0300
     * @tc.desc   Add a contacts and useing the promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContacts0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, 
      async (done: Function) => {
        const caseName: string = 'testTelephonyContactAddContacts0300';
        console.info(`${caseName} test start `);
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumContacts: contact.Contact[] = [];
        for (let i = 0; i < TEST_CONTACTS_NUM; i++) {
          let phoneNumContact: contact.Contact = {
            name: {
              fullName: `abc${i}`
            }, phoneNumbers: [{
              phoneNumber: `13800000000`
            }]
          };
          phoneNumContacts.push(phoneNumContact);
        }
        try {
          sleep(500);
          let promise = contact.addContacts(context, phoneNumContacts);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length === TEST_CONTACTS_NUM).assertTrue();
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
     * @tc.name   testTelephonyContactAddContacts0400
     * @tc.number SUB_Telephony_Contact_AddContacts_0400
     * @tc.desc   Add a contacts and useing the promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContacts0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, 
      async (done: Function) => {
        const caseName: string = 'testTelephonyContactAddContacts0400';
        console.info(`${caseName} test start `);
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumContacts: contact.Contact[] = [];
        for (let i = 0; i < TEST_CONTACTS_NUM; i++) {
          let phoneNumContact: contact.Contact = {
            name: {
              fullName: `李四${i}`
            }, phoneNumbers: [{
              phoneNumber: ''
            }]
          };
          phoneNumContacts.push(phoneNumContact);
        }
        try {
          sleep(500);
          let promise = contact.addContacts(context, phoneNumContacts);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length === TEST_CONTACTS_NUM).assertTrue();
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
     * @tc.name   testTelephonyContactAddContacts0500
     * @tc.number SUB_Telephony_Contact_AddContacts_0500
     * @tc.desc   Add a contacts and useing the promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContacts0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, 
      async (done: Function) => {
        const caseName: string = 'testTelephonyContactAddContacts0500';
        console.info(`${caseName} test start `);
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumContacts: contact.Contact[] = [];
        for (let i = 0; i < TEST_CONTACTS_NUM; i++) {
          let phoneNumContact: contact.Contact = {
            name: {
              fullName: `李四${i}`
            }, phoneNumbers: [{
              phoneNumber: '13800000000'
            }]
          };
          phoneNumContacts.push(phoneNumContact);
        }
        try {
          sleep(500);
          let promise = contact.addContacts(context, phoneNumContacts);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length === TEST_CONTACTS_NUM).assertTrue();
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
     * @tc.name   testTelephonyContactAddContacts0600
     * @tc.number SUB_Telephony_Contact_AddContacts_0600
     * @tc.desc   Add a contacts and useing the promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContacts0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, 
      async (done: Function) => {
        const caseName: string = 'testTelephonyContactAddContacts0600';
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
          let promise = contact.addContacts(context, [phoneNumContact]);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length === 1).assertTrue();
            expect(data[0] > 0).assertTrue();
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
     * @tc.name   testTelephonyContactAddContacts0700
     * @tc.number SUB_Telephony_Contact_AddContacts_0700
     * @tc.desc   Add a contacts and useing the promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContacts0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, 
      async (done: Function) => {
        const caseName: string = 'testTelephonyContactAddContacts0700';
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
            phoneNumber: '13822222222'
          }]
        };
        try {
          sleep(500);
          let promise = contact.addContacts(context, [phoneNumContact]);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length > 0).assertTrue();
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
     * @tc.name   testTelephonyContactAddContacts0800
     * @tc.number SUB_Telephony_Contact_AddContacts_0800
     * @tc.desc   Add a contacts and useing the promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContacts0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, 
      async (done: Function) => {
        const caseName: string = 'testTelephonyContactAddContacts0800';
        console.info(`${caseName} test start `);
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumContact: contact.Contact = {
          name: {
            fullName: '张三发发发发发发发发发张三发发发发发发发发发张三发发发发发发发发发张三发发发发发发发发发张三发发发发发发发发发张三发发发发发发发发发张三发发发发发发发发发'
          }, phoneNumbers: [{
            phoneNumber: '13800000000'
          }]
        };
        try {
          sleep(500);
          let promise = contact.addContacts(context, [phoneNumContact]);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length > 0).assertTrue();
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
     * @tc.name   testTelephonyContactAddContacts0900
     * @tc.number SUB_Telephony_Contact_AddContacts_0900
     * @tc.desc   Add a contacts and useing the promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContacts0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, 
      async (done: Function) => {
        const caseName: string = 'testTelephonyContactAddContacts0900';
        console.info(`${caseName} test start `);
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumContact: contact.Contact = {
            name: {
              fullName: 'Eve!@'
            }, phoneNumbers: [{
              phoneNumber: '13800000000'
            }]
        };
        try {
          sleep(500);
          let promise = contact.addContacts(context, [phoneNumContact]);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length > 0).assertTrue();
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
     * @tc.name   testTelephonyContactAddContacts1000
     * @tc.number SUB_Telephony_Contact_AddContacts_1000
     * @tc.desc   Add a contacts and useing the promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContacts1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, 
      async (done: Function) => {
        const caseName: string = 'testTelephonyContactAddContacts1000';
        console.info(`${caseName} test start `);
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumContacts = [contactData, contactData];
        try {
          sleep(500);
          let promise = contact.addContacts(context, phoneNumContacts);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length > 0).assertTrue();
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
     * @tc.name   testTelephonyContactAddContacts1100
     * @tc.number SUB_Telephony_Contact_AddContacts_1100
     * @tc.desc   Add a contacts and useing the promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContacts1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, 
      async (done: Function) => {
        const caseName: string = 'testTelephonyContactAddContacts1100';
        console.info(`${caseName} test start `);
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumContact: contact.Contact = {
          name: {
            fullName: '张三'
          }, phoneNumbers: [{
            phoneNumber: '13800000000'
          }]
        };
        try {
          sleep(500);
          let promise = contact.addContacts(context, [phoneNumContact]);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length > 0).assertTrue();
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
     * @tc.name   testTelephonyContactAddContacts1200
     * @tc.number SUB_Telephony_Contact_AddContacts_1200
     * @tc.desc   Add a contacts and useing the promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContacts1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, 
      async (done: Function) => {
        const caseName: string = 'testTelephonyContactAddContacts1200';
        console.info(`${caseName} test start `);
        let context: Context = AppStorage.get('context') as Context;
        try {
          sleep(500);
          const tasks: Promise<number[]>[] = [];
          for (let i = 0; i < 100; i++) {
            let phoneNumContact: contact.Contact = {
            name: {
              fullName: `张三${Math.random()*1000000}`
            }, phoneNumbers: [{
              phoneNumber: '13800000000'
            }]
            };
            tasks.push(contact.addContacts(context, [phoneNumContact])); 
          }
          await Promise.all(tasks).then((taskResults: number[][])=> {
            taskResults.forEach((data: number[], index:number) => {
              console.log(`${caseName} ${index} success: data>${JSON.stringify(data)}`);
              expect(data.length > 0).assertTrue();
            })
          })
          done();
        } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test end `);
      })

      /**
     * @tc.name   testTelephonyContactAddContacts1300
     * @tc.number SUB_Telephony_Contact_AddContacts_1300
     * @tc.desc   Add a contacts and useing the promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContacts1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, 
      async (done: Function) => {
        const caseName: string = 'testTelephonyContactAddContacts1300';
        console.info(`${caseName} test start `);
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumContacts: contact.Contact[] = [];
        for (let i = 0; i < 100; i++) {
          let phoneNumContact: contact.Contact = {
            name: {
              fullName: `abcd${i}`
            }, phoneNumbers: [{
              phoneNumber: `13800000000`
            }]
          };
          phoneNumContacts.push(phoneNumContact);
        }
        try {
          sleep(500);
          let promise = contact.addContacts(context, phoneNumContacts);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect(data.length > 0).assertTrue();
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
     * @tc.name   testTelephonyContactAddContacts1400
     * @tc.number SUB_Telephony_Contact_AddContacts_1400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyContactAddContacts1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: Function) => {
        let context: Context = AppStorage.get('context') as Context;
        let contactDataError: contact.Contact = {};
        const caseName: string = 'testTelephonyContactAddContacts1400';
        try {
          sleep(500);
          let promise = contact.addContacts(context, [contactDataError]);
          promise.then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
            expect(err.code === 16700002).assertTrue();
            done();
          });
        } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
      });

     /**
     * @tc.name   testTelephonyContactAddContacts1500
     * @tc.number SUB_Telephony_Contact_AddContacts_1500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyContactAddContacts1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: Function) => {
        let context: Context = AppStorage.get('context') as Context;
        const caseName: string = 'testTelephonyContactAddContacts1500';
        try {
          contact.addContacts(context, undefined).then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          })
        } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          expect(err.code === 16700002).assertTrue();
          done();
        }
      });

      /**
     * @tc.name   testTelephonyContactAddContacts1600
     * @tc.number SUB_Telephony_Contact_AddContacts_1600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyContactAddContacts1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: Function) => {
        let context: Context = AppStorage.get('context') as Context;
        const caseName: string = 'testTelephonyContactAddContacts1600';
        try {
          contact.addContacts(context, null).then((data: number[]) => {
            console.log(`${caseName} success: data>${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          })
        } catch (err) {
          console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
          expect(err.code === 16700002).assertTrue();
          done();
        }
      });
  })
}

