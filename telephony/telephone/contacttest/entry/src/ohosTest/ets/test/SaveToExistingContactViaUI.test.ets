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
import { Component, Driver, On, ON } from '@ohos.UiTest';

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

function delay(ms: number): Promise<void> {
    return new Promise<void>((resolve) => {
        setTimeout(() => {
            resolve();
        }, ms);
    });
}

async function getComponent(driver: Driver, onType: On) {
    let item:Component = await driver.findComponent(onType);
    if(!item) {
        await getComponent(driver, onType);
    } else {
        console.log(`get component: ${JSON.stringify(item)}`);
        await item.click();
    }
}

export default function SaveToExistingContactViaUITest() {
  describe('SaveToExistingContactViaUITest', () => {

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


    /**
     * @tc.number     : SUB_Telephony_Contact_SaveToExistingContactViaUI_0100
     * @tc.name       : testTelephonyContactSaveToExistingContactViaUI0100
     * @tc.desc       : Call the contact SaveToExistingContactViaUI interface, and use the Promise method as an asynchronous method for the SaveToExistingContactViaUI contact 15
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactSaveToExistingContactViaUI0100', 0, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSaveToExistingContactViaUI0100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, async (err: BusinessError, data: number) => {
            if(err) {
                console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
                ExpectFail();
                done();
            } else {
                console.log(`${caseName} addContact: success>${JSON.stringify(err)}`);
                ExpectTrue(data > 0);
                let promise = contact.saveToExistingContactViaUI(context, {
                    phoneNumbers: [{
                        phoneNumber: "13555558888"
                    }],
                });
                try {
                    let driver: Driver = Driver.create();
                    let onType2: On = ON.text('小李');
                    await getComponent(driver, onType2);
                    await delay(500);
                    let onType: On = ON.id('save_click_btn');
                    await getComponent(driver, onType);
                } catch (err) {
                    console.log(`${caseName} --ger component catch: err>${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                }
                promise.then((data: number) => {
                    console.log(`${caseName} SaveToExistingContactViaUI: data>${JSON.stringify(data)}`);
                    ExpectTrue(data > 0);
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`${caseName} SaveToExistingContactViaUI: err>${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_SaveToExistingContactViaUI_0200
     * @tc.name       : testTelephonyContactSaveToExistingContactViaUI0200
     * @tc.desc       : Call the contact SaveToExistingContactViaUI interface, and use the Promise method as an asynchronous method for the SaveToExistingContactViaUI contact 15
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactSaveToExistingContactViaUI0200', 0, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSaveToExistingContactViaUI0200";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, async (err: BusinessError, data: number) => {
            if(err) {
                console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
                ExpectFail();
                done();
            } else {
                console.log(`${caseName} addContact: success>${JSON.stringify(err)}`);
                ExpectTrue(data > 0);
                let promise = contact.saveToExistingContactViaUI(context, {
                    phoneNumbers: [{
                        phoneNumber: "13555558888"
                    }],
                });
                try {
                    let driver: Driver = Driver.create();
                    let onType2: On = ON.text('小李');
                    await getComponent(driver, onType2);
                    await delay(500);
                    let onType: On = ON.id('cancel_btn');
                    await getComponent(driver, onType);
                    await delay(500);
                    let onType1: On = ON.text('不保存');
                    await getComponent(driver, onType1);
                    await delay(500);
                } catch (err) {
                    console.log(`${caseName} --ger component catch: err>${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                }
                promise.then((data: number) => {
                    console.log(`${caseName} SaveToExistingContactViaUI: data>${JSON.stringify(data)}`);
                    ExpectTrue(data == -1);
                    done();
                }).catch((err: BusinessError) => {
                    console.log(`${caseName} SaveToExistingContactViaUI: err>${JSON.stringify(err)}`);
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
  });
}