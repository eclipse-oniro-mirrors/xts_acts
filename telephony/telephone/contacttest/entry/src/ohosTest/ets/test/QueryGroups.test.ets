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

import { describe, beforeAll, afterEach, it, expect, beforeEach, afterAll, Level, Size, TestType } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import dataShare from '@ohos.data.dataShare';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { SavePhoto, GetUri } from './ContactTestUtil.test';

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
};

async function addGroups() {
  try {
    let context: Context = AppStorage.get('context') as Context;
    let DAHelper: dataShare.DataShareHelper = await dataShare.createDataShareHelper(context, 'datashare:///com.ohos.contactsdataability');
    let insertValues: Record<string, string | number> = {
      'group_name': 'test',
      'lastest_modify_time': new Date().valueOf(),
      'account_id': 1
    };
    let data:number = await DAHelper.insert(
      'datashare:///com.ohos.contactsdataability/contacts/groups',
      insertValues
    );
    return data
  }catch (err) {
    console.info(`addGroups catch: ${JSON.stringify(err)}`);
    return -1
  }
}

async function deleteGroups() {
  try {
    let context: Context = AppStorage.get('context') as Context;
    let DAHelper: dataShare.DataShareHelper = await dataShare.createDataShareHelper(context, 'datashare:///com.ohos.contactsdataability');
    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
    let DataSharePredicates = predicates.prefixKey('group_name');
    let del: number = await DAHelper.delete('datashare:///com.ohos.contactsdataability/contacts/groups', DataSharePredicates);
    console.info(`deleteGroups count：${del}`);
  }catch (err) {
    console.info(`deleteGroups catch: ${JSON.stringify(err)}`);
  }

}

export default function QueryGroupsTest() {
  describe('QueryGroupsTest', () => {

    let fileName = 'QueryGroupsTest.jpg';
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
    const INVALID_CONTACT_ID = -1;

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

    afterAll(async (done: Function) => {
      await deleteGroups();
      done();
    });

    /**
     * @tc.name   testTelephonyContactQueryGroups0100
     * @tc.number SUB_Telephony_Contact_QueryGroups_0100
     * @tc.desc   Query all groups of contacts and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactQueryGroups0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryGroups0100";
      console.info(`${caseName} test start `);
      let groupsId:number = await addGroups();
      contactData.groups = [{groupId: groupsId,title: '测试群组'}];
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        contact.addContact(context, contactData, (err, data) => {
          sleep(500);
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryGroups(context, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} queryGroups: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryGroups: success data->${JSON.stringify(data)}`);
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
     * @tc.name   testTelephonyContactQueryGroups0200
     * @tc.number SUB_Telephony_Contact_QueryGroups_0200
     * @tc.desc   Query all groups of contacts and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryGroups0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryGroups0200";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        contact.addContact(context, contactData, (err, data) => {
          sleep(500);
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryGroups(context, holder, (err: BusinessError, data) => {
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
     * @tc.name   testTelephonyContactQueryGroups0400
     * @tc.number SUB_Telephony_Contact_QueryGroups_0400
     * @tc.desc   Query all groups of contacts and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryGroups0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryGroups0400";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        contact.addContact(context, contactData, (err, data) => {
          sleep(500);
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryGroups(context, {
              holderId: -1,
              bundleName: "",
              displayName: "phone"
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0)
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
     * @tc.name   testTelephonyContactQueryGroups0500
     * @tc.number SUB_Telephony_Contact_QueryGroups_0500
     * @tc.desc   Query all groups of contacts and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryGroups0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryGroups0500";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        contact.addContact(context, contactData, (err, data) => {
          sleep(500);
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryGroups(context, holder);
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
     * @tc.name   testTelephonyContactQueryGroups0700
     * @tc.number SUB_Telephony_Contact_QueryGroups_0700
     * @tc.desc   Query all groups of contacts and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryGroups0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryGroups0700";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        contact.addContact(context, contactData, (err, data) => {
          sleep(500);
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryGroups(context, {
              holderId: -1,
              bundleName: "",
              displayName: ""
            });
            promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length > 0)
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
     * @tc.name   testTelephonyContactQueryGroups1100
     * @tc.number SUB_Telephony_Contact_QueryGroups_1100
     * @tc.desc   Query all groups of contacts and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryGroups1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryGroups1100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        contact.addContact(context, contactData, (err, data) => {
          sleep(500);
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            contact.queryGroups(context, {
              holderId: -1,
              bundleName: "com.ohos.contacts",
              displayName: ""
            }, (err: BusinessError, data) => {
              if (err) {
                console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
                ExpectTrue(err.code === 401);
                done();
              } else {
                console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
                expect().assertFail();
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
     * @tc.name   testTelephonyContactQueryGroups1200
     * @tc.number SUB_Telephony_Contact_QueryGroups_1200
     * @tc.desc   Query all groups of contacts and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryGroups1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryGroups1200";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        contact.addContact(context, contactData, async (err, data) => {
          sleep(500);
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryGroups(context, {
              holderId: 1.5,
              bundleName: "com.ohos.contacts",
            });
            await promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length > 0)
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
     * @tc.name   testTelephonyContactQueryGroups1300
     * @tc.number SUB_Telephony_Contact_QueryGroups_1300
     * @tc.desc   Query all groups of contacts and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryGroups1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryGroups1300";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        sleep(500);
        contact.addContact(context, contactData, async (err, data) => {
          sleep(500);
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data > 0);
            let promise = contact.queryGroups(context, {
              bundleName: "",
              displayName: "phone"
            });
            await promise.then((data) => {
              console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data.length > 0)
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


















