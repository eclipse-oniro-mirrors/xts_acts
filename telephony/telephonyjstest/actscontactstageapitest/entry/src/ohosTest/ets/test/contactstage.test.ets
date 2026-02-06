/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import contact from '@ohos.contact';
import { afterAll, afterEach, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { bundleManager } from '@kit.AbilityKit';
import account from '@ohos.account.osAccount';
import { BusinessError } from '@ohos.base';

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

export default function ContactInterfaceStageTest() {

  describe('ContactInterfaceStageTest', () => {
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
    let contactData:contact.Contact = {
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
        email: "13800000000@email.com",
        labelName: "自定义邮箱",
        labelId: 1,
        displayName: "emailDisplayName"
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
      } ,
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
    let holder:contact.Holder = {
      holderId: 1,
      bundleName: "",
      displayName: ""
    };
    let attr:contact.ContactAttributes = {
      attributes: [contact.Attribute.ATTR_CONTACT_EVENT, contact.Attribute.ATTR_EMAIL,
        contact.Attribute.ATTR_GROUP_MEMBERSHIP,
        contact.Attribute.ATTR_IM, contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_NICKNAME,
        contact.Attribute.ATTR_NOTE, contact.Attribute.ATTR_ORGANIZATION, contact.Attribute.ATTR_PHONE,
        contact.Attribute.ATTR_PORTRAIT, contact.Attribute.ATTR_POSTAL_ADDRESS,
        contact.Attribute.ATTR_RELATION,
        contact.Attribute.ATTR_SIP_ADDRESS, contact.Attribute.ATTR_WEBSITE]
    };
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryMyCard_test_0100
     * @tc.name contact::queryMyCard
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryMyCard_test_0100", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      contact.queryMyCard(context, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryMyCard_test_0100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryMyCard_test_0100  data = " + JSON.stringify(data));
        done();
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryMyCard_test_0200
     * @tc.name contact::queryMyCard
     * @tc.desc Function test
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryMyCard_test_0200", TestType.FUNCTION | Size.SmallTest | Level.LEVEL2, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      contact.queryMyCard(context, attr, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryMyCard_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryMyCard_test_0200  data = " + JSON.stringify(data));
        done();
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryMyCard_test_0300
     * @tc.name contact::queryMyCard
     * @tc.desc Function test
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryMyCard_test_0300", TestType.FUNCTION | Size.SmallTest | Level.LEVEL2, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      let promise = contact.queryMyCard(context, attr);
      promise.then((data) => {
        console.info("SUB_Telephony_ContactsApi_queryMyCard_test_0300  data = " + JSON.stringify(data));
        done();
      }).catch((err:BusinessError) => {
        console.info("SUB_Telephony_ContactsApi_queryMyCard_test_0300  err = " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
        return;
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_isMyCard_test_0100
     * @tc.name contact::addContact
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_isMyCard_test_0100", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      contact.addContact(context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_isMyCard_test_0100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_isMyCard_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.isMyCard(context, data, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_isMyCard_test_0100  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_isMyCard_test_0100  data = " + JSON.stringify(data));
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_isMyCard_test_0200
     * @tc.name contact::addContact
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_isMyCard_test_0200", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(1000);
      contact.addContact(context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_isMyCard_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_isMyCard_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.isMyCard(context, data);
        promise.then((data) => {
          console.info("SUB_Telephony_ContactsApi_isMyCard_test_0200  data = " + JSON.stringify(data));
          done();
        }).catch((err:BusinessError) => {
          console.info("SUB_Telephony_ContactsApi_isMyCard_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_updateContact_test_0100
     * @tc.name contact::queryKey
     * @tc.desc Function test
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_updateContact_test_0100", TestType.FUNCTION | Size.SmallTest | Level.LEVEL2, async (done:Function) => {
      const caseName: string = "SUB_Telephony_ContactsApi_updateContact_test_0100";
      console.info(`${caseName} test start`);
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err:BusinessError, data:number) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_updateContact_test_0100  err = " + JSON.stringify(err));
          ExpectFail();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_updateContact_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context, data, (err:BusinessError, keyData:string) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_updateContact_test_0100  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_updateContact_test_0100  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined){
            contact.updateContact(context, {
              id: data,
              key: keyData,
              emails: [{
                email: "13800000001@email.com",
                labelName: "自定义邮箱",
                labelId: 1,
                displayName: "emailDisplayName"
              }]
            }, (err) => {
              if (err) {
                console.info("SUB_Telephony_ContactsApi_updateContact_test_0100  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
              }
              console.log('updateContact success');
              contact.queryKey(context, data, (err, newKey) => {
                if (err) {
                  console.info("SUB_Telephony_ContactsApi_updateContact_test_0100  err = " + JSON.stringify(err));
                  expect(false).assertTrue();
                  done();
                  return;
                }
                console.info("SUB_Telephony_ContactsApi_updateContact_test_0100  newKey = " + JSON.stringify(newKey));
                contact.queryContact(context, newKey, (err, data) => {
                  if (err) {
                    console.info("SUB_Telephony_ContactsApi_updateContact_test_0100  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                  }
                  console.info("SUB_Telephony_ContactsApi_updateContact_test_0100  data = " + JSON.stringify(data));
                  let resDate: contact.Contact = data;
                  if (resDate.emails !== undefined) {
                    let emails: contact.Email[] = resDate.emails
                    if (emails[0].email !== undefined) {
                      let email: string = emails[0].email;
                      expect(email === "13800000001@email.com").assertTrue();
                      done();
                    }
                  };
                  ;
                });
              });
            });
          }else {done()}
        })
      });
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_updateContact_test_0200
     * @tc.name contact::queryKey
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_updateContact_test_0200", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_updateContact_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_updateContact_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context, data, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_updateContact_test_0200  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_updateContact_test_0200  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined){
            contact.updateContact(context, {
              id: data,
              key: keyData,
              emails: [{
                email: "13800000001@email.com",
                labelName: "自定义邮箱",
                labelId: 1,
                displayName: "emailDisplayName"
              }]
            }, attr, (err) => {
              if (err) {
                console.info("SUB_Telephony_ContactsApi_updateContact_test_0200  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
              }
              console.log('updateContact success');
              contact.queryKey(context, data, (err, newKey) => {
                if (err) {
                  console.info("SUB_Telephony_ContactsApi_updateContact_test_0200  err = " + JSON.stringify(err));
                  expect(false).assertTrue();
                  done();
                  return;
                }
                console.info("SUB_Telephony_ContactsApi_updateContact_test_0200  newKey = " + JSON.stringify(newKey));
                contact.queryContact(context, newKey, (err, data) => {
                  if (err) {
                    console.info("SUB_Telephony_ContactsApi_updateContact_test_0200  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                  }
                  console.info("SUB_Telephony_ContactsApi_updateContact_test_0200  data = " + JSON.stringify(data));
                  let resDate: contact.Contact = data;
                  if (resDate.emails !== undefined) {
                    let emails: contact.Email[] = resDate.emails;
                    if (emails[0].email !== undefined) {
                      let email: string = emails[0].email;
                      expect(email === "13800000001@email.com").assertTrue();
                      done();
                    };
                  };
                });
              });
            });
          }else {done()}
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_updateContact_test_0300
     * @tc.name contact::queryKey
     * @tc.desc Function test
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_updateContact_test_0300", TestType.FUNCTION | Size.SmallTest | Level.LEVEL2, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_updateContact_test_0300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_updateContact_test_0300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context, data, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_updateContact_test_0300  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_updateContact_test_0300  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined) {
            let promise = contact.updateContact(context, {
              id: data,
              key: keyData,
              emails: [{
                email: "13800000001@email.com",
                labelName: "自定义邮箱",
                labelId: 1,
                displayName: "emailDisplayName"
              }]
            }, attr);
            promise.then(() => {
              console.log('updateContact success');
              contact.queryKey(context, data, (err, newKey) => {
                if (err) {
                  console.info("SUB_Telephony_ContactsApi_updateContact_test_0300  err = " + JSON.stringify(err));
                  expect(false).assertTrue();
                  done();
                  return;
                }
                console.info("SUB_Telephony_ContactsApi_updateContact_test_0300  newKey = " + JSON.stringify(newKey));
                contact.queryContact(context, newKey, (err, data) => {
                  if (err) {
                    console.info("SUB_Telephony_ContactsApi_updateContact_test_0300  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                  }
                  let resDate: contact.Contact = data;
                  if (resDate.emails !== undefined) {
                    let emails: contact.Email[] = resDate.emails;
                    if (emails[0].email !== undefined) {
                      let email: string = emails[0].email;
                      expect(email === "13800000001@email.com").assertTrue();
                      done();
                    };
                  };
                });
              });
            }).catch((err:BusinessError) => {
              console.info("SUB_Telephony_ContactsApi_updateContact_test_0300  err = " + JSON.stringify(err));
              expect(false).assertTrue();
              done();
              return;
            });
          }else {done()}
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_updateContact_test_0400
     * @tc.name contact::addContact
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_updateContact_test_0400", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_updateContact_test_0400  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_updateContact_test_0400  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.isLocalContact(context, data, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_updateContact_test_0400  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_updateContact_test_0400  data = " + JSON.stringify(data));
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_isLocalContact_test_0200
     * @tc.name contact::addContact
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_isLocalContact_test_0200", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_isLocalContact_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_isLocalContact_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.isLocalContact(context, data);
        promise.then((data) => {
          console.info("SUB_Telephony_ContactsApi_isLocalContact_test_0200  data = " + JSON.stringify(data));
          done();
        }).catch((err:BusinessError) => {
          console.info("SUB_Telephony_ContactsApi_isLocalContact_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });
 
    /**
     * @tc.number SUB_Telephony_ContactsApi_selectContacts_test_0100
     * @tc.name contact::addContact
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_selectContacts_test_0100", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (!err) {
          console.info("SUB_Telephony_ContactsApi_selectContacts_test_0100  data = " + JSON.stringify(data));
          expect(data > 0).assertTrue();
          done();
          return;
        }
        contact.selectContacts((err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_selectContacts_test_0100  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_selectContacts_test_0100  data = " + JSON.stringify(data));
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_selectContacts_test_0200
     * @tc.name contact::addContact
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_selectContacts_test_0200", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (!err) {
          console.info("SUB_Telephony_ContactsApi_selectContacts_test_0200  data = " + JSON.stringify(data));
          expect(data > 0).assertTrue();
          done();
          return;
        }
        contact.selectContacts().then((data) => {
          console.info("SUB_Telephony_ContactsApi_selectContacts_test_0200  data = " + JSON.stringify(data));
          done();
        }).catch((err:BusinessError) => {
          console.info("SUB_Telephony_ContactsApi_selectContacts_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_selectContacts_test_0300
     * @tc.name contact::addContact
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_selectContacts_test_0300", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (!err) {
          console.info("SUB_Telephony_ContactsApi_selectContacts_test_0300  data = " + JSON.stringify(data));
          expect(data > 0).assertTrue();
          done();
          return;
        }
        contact.selectContacts({
          isMultiSelect: false
        }, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_selectContacts_test_0300  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_selectContacts_test_0300  data = " + JSON.stringify(data));
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_selectContacts_test_0400
     * @tc.name contact::addContact
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_selectContacts_test_0400", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (!err) {
          console.info("SUB_Telephony_ContactsApi_selectContacts_test_0400  data = " + JSON.stringify(data));
          expect(data > 0).assertTrue();
          done();
          return;
        }
        contact.selectContacts({
          isMultiSelect: false
        }).then((data) => {
          console.info("SUB_Telephony_ContactsApi_selectContacts_test_0400  data = " + JSON.stringify(data));
          done();
        }).catch((err:BusinessError) => {
          console.info("SUB_Telephony_ContactsApi_selectContacts_test_0400  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_query_key_test_0100
     * @tc.name contact:queryKey
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_query_key_test_0100", TestType.FUNCTION | Size.SmallTest | Level.LEVEL1, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      let rawContactId = await contact.addContact(context, contactData);
      sleep(500);
      expect(rawContactId > 0).assertTrue();
      try {
        let resultSet = await contact.queryKey(context, rawContactId, holder);
        console.info("SUB_Telephony_ContactsApi_query_key_test_0100 : query resultSet = " + JSON.stringify(resultSet));
        expect(JSON.stringify(resultSet) === null).assertFalse();
        done();
      } catch (error) {
        console.info("SUB_Telephony_ContactsApi_query_key_test_0100 query error = " + error);
        done();
      }
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_query_key_test_0200
     * @tc.name contact::queryKey
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_query_key_test_0200", TestType.FUNCTION | Size.SmallTest | Level.LEVEL1, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      let caseName = "SUB_Telephony_ContactsApi_query_key_test_0200";
      sleep(500);
      contact.addContact(context,contactData,(err:BusinessError,rawContactId:number)=>{
        sleep(500);
        if (err) {
          console.log(`${caseName} add contact err>${JSON.stringify(err)}`)
          ExpectFail();
          done();
        }else {
          console.log(`${caseName} add contact success>${JSON.stringify(rawContactId)}`)
          ExpectTrue(rawContactId>0);
          contact.queryKey(context,rawContactId,(keyerr:BusinessError,keydata:string)=>{
            if(keyerr){
              console.log(`${caseName} keyerr err>${JSON.stringify(keyerr)}`);
              ExpectFail();
              done();
            }else {
              console.log(`${caseName} keydata >${JSON.stringify(keydata)}`);
              expect(keydata!='').assertTrue();
              done();
            };
          });
        };
      });
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_insert_test_0100
     * @tc.name contact::addContact
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_insert_test_0100", TestType.FUNCTION | Size.SmallTest | Level.LEVEL1, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      let contactDataError:contact.Contact = {};
      try {
        sleep(500);
        let rawContactId = await contact.addContact(context, contactDataError);
        console.info("SUB_Telephony_ContactsApi_insert_test_0100 : rawContactId = " + rawContactId);
        expect(rawContactId == -1).assertTrue();
        done();
      } catch (error) {
        console.info("SUB_Telephony_ContactsApi_insert_test_0100 : raw_contact insert error = " + error);
        done();
      }
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_query_contact_test_0300
     * @tc.name contact::queryContact
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_query_contact_test_0300", TestType.FUNCTION | Size.SmallTest | Level.LEVEL1, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      let queryId = "-1";
      try {
        let resultSet = await contact.queryContact(context, queryId);
        if (resultSet == null) {
          console.info("SUB_Telephony_ContactsApi_query_contact_test_0300 is null");
        }
        if (resultSet == undefined) {
          console.info("SUB_Telephony_ContactsApi_query_contact_test_0300 is undefined");
        }
        console.info("SUB_Telephony_ContactsApi_query_contact_test_0300 : updateCode = " + JSON.stringify(resultSet));
        expect(resultSet == undefined).assertTrue();
        done();
      } catch (error) {
        console.info("SUB_Telephony_ContactsApi_query_contact_test_0300 query error = " + error);
        done();
      }
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_query_email_test_0400
     * @tc.name contact::queryContactsByEmail
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_query_email_test_0400", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      let email = "email2222";
      try {
        let resultSet = await contact.queryContactsByEmail(context, email);
        console.info("SUB_Telephony_ContactsApi_query_email_test_0400 : query resultSet = " +
        JSON.stringify(resultSet));
        expect(resultSet.length == 0).assertTrue();
        done();
      } catch (error) {
        console.info("SUB_Telephony_ContactsApi_query_email_test_0400 query error = " + error);
        done();
      }
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_query_phoneNumber_test_0500
     * @tc.name contact::queryContactsByPhoneNumber
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_query_phoneNumber_test_0500", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumber = "19999999";
      try {
        let resultSet = await contact.queryContactsByPhoneNumber(context, phoneNumber);
        console.info("SUB_Telephony_ContactsApi_query_phoneNumber_test_0500 : query resultSet = " +
        JSON.stringify(resultSet));
        expect(resultSet.length == 0).assertTrue();
        done();
      } catch (error) {
        console.info("SUB_Telephony_ContactsApi_query_phoneNumber_test_0500 query error = " + error);
        done();
      }
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_query_key_test_0600
     * @tc.name contact::queryKey
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_query_key_test_0600", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      let idTest = -1;
      try {
        let resultSet = await contact.queryKey(context, idTest);
        console.info("SUB_Telephony_ContactsApi_query_key_test_0600 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet.length == 0).assertTrue();
        done();
      } catch (error) {
        console.info("SUB_Telephony_ContactsApi_query_key_test_0600 query error = " + error);
        done();
      }
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_addContact_test_0100
     * @tc.name contact::deleteContact
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_addContact_test_0100", TestType.FUNCTION | Size.SmallTest | Level.LEVEL1, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_addContact_test_0100 addContact err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_addContact_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context, data, (err:BusinessError, keyData:string) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_addContact_test_0100 queryKey  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_addContact_test_0100  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined){
            contact.deleteContact(context, keyData, (err:BusinessError) => {
              if (err) {
                console.info("SUB_Telephony_ContactsApi_addContact_test_0100  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
              }else {
                console.log('deleteContact success ');
                ExpectTrue(true);
                done();
              }
            });
          }else {done()}
        });
      });
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_addContact_test_0200
     * @tc.name contact::deleteContact
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_addContact_test_0200", TestType.FUNCTION | Size.SmallTest | Level.LEVEL1, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      let promise = contact.addContact(context, contactData);
      sleep(500);
      promise.then((data:number) => {
        console.info("SUB_Telephony_ContactsApi_addContact_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context, data, (err, keyData) => {
          if (err) {
            console.info("err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_addContact_test_0200  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined) {
            let promise = contact.deleteContact(context, keyData);
            promise.then(() => {
              console.log(`deleteContact success`);
              done();
            }).catch((err:BusinessError) => {
              console.info("SUB_Telephony_ContactsApi_addContact_test_0200  err = " + JSON.stringify(err));
              expect(false).assertTrue();
              done();
              return;
            });
          }else {done()}
        });
      }).catch((err:BusinessError) => {
        console.info("SUB_Telephony_ContactsApi_addContact_test_0200  err = " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
        return;
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContact_test_0100
     * @tc.name contact::queryKey
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContact_test_0100", TestType.FUNCTION | Size.SmallTest | Level.LEVEL1, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      expect(holder.bundleName === null).assertFalse();
      expect(holder.displayName === null).assertFalse();
      expect(holder.holderId != 0).assertTrue();
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContact_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context, data, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContact_test_0100  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0100  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined){
            contact.queryContact(context, keyData, (err, data) => {
              if (err) {
                console.info("SUB_Telephony_ContactsApi_queryContact_test_0100  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
              }
              console.info("SUB_Telephony_ContactsApi_queryContact_test_0100  data = " + JSON.stringify(data));
              expect(data != null).assertTrue();
              done();
            });
          }else {done()}
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContact_test_0200
     * @tc.name contact::queryKey
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContact_test_0200", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContact_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context, data, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContact_test_0200  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0200  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined){
            contact.queryContact(context, keyData, holder, (err, data) => {
              if (err) {
                console.info("SUB_Telephony_ContactsApi_queryContact_test_0200  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
              }
              console.info("SUB_Telephony_ContactsApi_queryContact_test_0200  data = " + JSON.stringify(data));
              done();
            });
          }else {done()}
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContact_test_0300
     * @tc.name contact::queryKey
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContact_test_0300", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContact_test_0300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context, data, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContact_test_0300  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0300  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined){
            contact.queryContact(context, keyData, attr, (err, data) => {
              if (err) {
                console.info("SUB_Telephony_ContactsApi_queryContact_test_0300  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
              }
              console.info("SUB_Telephony_ContactsApi_queryContact_test_0300  data = " + JSON.stringify(data));
              expect(data != null).assertTrue();
              done();
            });
          }else {done()}
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContact_test_0400
     * @tc.name contact::queryKey
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContact_test_0400", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0400  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContact_test_0400  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context, data, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContact_test_0400  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0400  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined){
            contact.queryContact(context, keyData, holder, attr, (err, data) => {
              if (err) {
                console.info("SUB_Telephony_ContactsApi_queryContact_test_0400  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
              }
              console.info("SUB_Telephony_ContactsApi_queryContact_test_0400  data = " + JSON.stringify(data));
              done();
            });
          }else {done()}
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContact_test_0500
     * @tc.name contact::queryKey
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContact_test_0500", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0500  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContact_test_0500  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context, data, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContact_test_0500  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0500  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined) {
            let promise = contact.queryContact(context, keyData, holder, attr);
            promise.then((data) => {
              console.info("SUB_Telephony_ContactsApi_queryContact_test_0500  data = " + JSON.stringify(data));
              done();
            }).catch((err:BusinessError) => {
              console.info("SUB_Telephony_ContactsApi_queryContact_test_0500  err = " + JSON.stringify(err));
              expect(false).assertTrue();
              done();
              return;
            });
          }else {done()}
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContacts_test_0100
     * @tc.name contact::queryContacts
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContacts_test_0100", TestType.FUNCTION | Size.SmallTest | Level.LEVEL1, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContacts_test_0100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContacts_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContacts(context, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContacts_test_0100  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContacts_test_0100  data = " + JSON.stringify(data));
          expect(data.length > 0).assertTrue();
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContacts_test_0200
     * @tc.name contact::queryContacts
     * @tc.desc Function test
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContacts_test_0200", TestType.FUNCTION | Size.SmallTest | Level.LEVEL2, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContacts_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContacts_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContacts(context, holder, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContacts_test_0200  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContacts_test_0200  data = " + JSON.stringify(data));
          expect(data.length >= 0).assertTrue();
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContacts_test_0300
     * @tc.name contact::queryContacts
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContacts_test_0300", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContacts_test_0300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContacts_test_0300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContacts(context, attr, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContacts_test_0300  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContacts_test_0300  data = " + JSON.stringify(data));
          expect(data.length > 0).assertTrue();
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContacts_test_0400
     * @tc.name contact::queryContacts
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContacts_test_0400", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContacts_test_0400  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContacts_test_0400  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContacts(context, holder, attr, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContacts_test_0400  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContacts_test_0400  data = " + JSON.stringify(data));
          expect(data.length >= 0).assertTrue();
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContacts_test_0500
     * @tc.name contact::queryContacts
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContacts_test_0500", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContacts_test_0500  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContacts_test_0500  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.queryContacts(context, holder, attr);
        promise.then((data) => {
          console.info("SUB_Telephony_ContactsApi_queryContacts_test_0500  data = " + JSON.stringify(data));
          expect(data.length >= 0).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.info("SUB_Telephony_ContactsApi_queryContacts_test_0500  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0100
     * @tc.name contact::queryContactsByPhoneNumber
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0100", TestType.FUNCTION | Size.SmallTest | Level.LEVEL1, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByPhoneNumber(context, '13800000000', (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0100  err = " +
            JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0100  data = " +
          JSON.stringify(data));
          expect(data.length > 0).assertTrue();
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0200
     * @tc.name contact::queryContactsByPhoneNumber
     * @tc.desc Function test
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0200", TestType.FUNCTION | Size.SmallTest | Level.LEVEL2, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByPhoneNumber(context, '13800000000', holder, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0200  err = " +
            JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0200  data = " +
          JSON.stringify(data));
          expect(data.length > 0).assertTrue();
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0300
     * @tc.name contact::queryContactsByPhoneNumber
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0300", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByPhoneNumber(context, '13800000000', attr, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0300  err = " +
            JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0300  data = " +
          JSON.stringify(data));
          expect(data.length > 0).assertTrue();
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0400
     * @tc.name contact::queryContactsByPhoneNumber
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0400", TestType.FUNCTION | Size.SmallTest | Level.LEVEL1, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0400  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0400  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByPhoneNumber(context, '13800000000', holder, attr, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0400  err = " +
            JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0400  data = " +
          JSON.stringify(data));
          expect(data.length > 0).assertTrue();
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0500
     * @tc.name contact::queryContactsByPhoneNumber
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0500", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0500  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0500  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.queryContactsByPhoneNumber(context, '13800000000', holder, attr);
        promise.then((data) => {
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0500  data = " +
          JSON.stringify(data));
          expect(data.length > 0).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0500  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContactsByEmail_test_0100
     * @tc.name contact::queryContactsByEmail
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0100", TestType.FUNCTION | Size.SmallTest | Level.LEVEL1, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByEmail(context, '13800000000@email.com', (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0100  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("v  data = " + JSON.stringify(data));
          expect(data.length > 0).assertTrue();
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContactsByEmail_test_0200
     * @tc.name contact::queryContactsByEmail
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0200", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByEmail(context, '13800000000@email.com', holder, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0200  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0200  data = " + JSON.stringify(data));
          expect(data.length > 0).assertTrue();
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContactsByEmail_test_0300
     * @tc.name contact::queryContactsByEmail
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0300", TestType.FUNCTION | Size.SmallTest | Level.LEVEL1, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByEmail(context, '13800000000@email.com', attr, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0300  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0300  data = " + JSON.stringify(data));
          expect(data.length > 0).assertTrue();
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContactsByEmail_test_0400
     * @tc.name contact::queryContactsByEmail
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0400", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0400  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0400  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByEmail(context, '13800000000@email.com', holder, attr, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0400  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0400  data = " + JSON.stringify(data));
          expect(data.length > 0).assertTrue();
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryContactsByEmail_test_0500
     * @tc.name contact::queryContactsByEmail
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0500", TestType.FUNCTION | Size.SmallTest | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0500  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0500  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.queryContactsByEmail(context, '13800000000@email.com', holder, attr);
        promise.then((data) => {
          console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0500  data = " + JSON.stringify(data));
          expect(data.length > 0).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0500  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryGroups_test_0100
     * @tc.name contact::queryGroups
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryGroups_test_0100", TestType.FUNCTION | Size.SmallTest | Level.LEVEL1, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryGroups_test_0100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryGroups_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryGroups(context, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryGroups_test_0100  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryGroups_test_0100  data = " + JSON.stringify(data));
          expect(data.length >= 0).assertTrue();
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryGroups_test_0200
     * @tc.name contact::queryGroups
     * @tc.desc Function test
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryGroups_test_0200", TestType.FUNCTION | Size.SmallTest | Level.LEVEL2, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryGroups_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryGroups_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryGroups(context, holder, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryGroups_test_0200  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryGroups_test_0200  data = " + JSON.stringify(data));
          expect(data.length >= 0).assertTrue();
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryGroups_test_0300
     * @tc.name contact::queryGroups
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryGroups_test_0300", TestType.FUNCTION | Size.SmallTest | Level.LEVEL1, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryGroups_test_0300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryGroups_test_0300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.queryGroups(context, holder);
        promise.then((data) => {
          console.info("SUB_Telephony_ContactsApi_queryGroups_test_0300  data = " + JSON.stringify(data));
          expect(data.length >= 0).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.info("SUB_Telephony_ContactsApi_queryGroups_test_0300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryHolders_test_0100
     * @tc.name contact::queryHolders
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryHolders_test_0100", TestType.FUNCTION | Size.SmallTest | Level.LEVEL1, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      contact.queryHolders(context, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryHolders_test_0100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryHolders_test_0100  data = " + JSON.stringify(data));
        expect(data.length >= 0).assertTrue();
        done();
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryHolders_test_0200
     * @tc.name contact::queryHolders
     * @tc.desc Function test
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryHolders_test_0200", TestType.FUNCTION | Size.SmallTest | Level.LEVEL2, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      let promise = contact.queryHolders(context as Context);
      promise.then((data) => {
        console.info("SUB_Telephony_ContactsApi_queryHolders_test_0200  data = " + JSON.stringify(data));
        expect(data.length >= 0).assertTrue();
        done();
      }).catch((err:BusinessError) => {
        console.info("SUB_Telephony_ContactsApi_queryHolders_test_0200  err = " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
        return;
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryKey_test_0100
     * @tc.name contact::queryKey
     * @tc.desc Function test
     * @tc.level 4
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryKey_test_0100", TestType.FUNCTION | Size.SmallTest | Level.LEVEL4, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryKey_test_0100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryKey_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context, data, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryKey_test_0100  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryKey_test_0100  keyData = " + JSON.stringify(keyData));
          expect(keyData != '').assertTrue();
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryKey_test_0200
     * @tc.name contact::queryKey
     * @tc.desc Function test
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryKey_test_0200", TestType.FUNCTION | Size.SmallTest | Level.LEVEL2, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryKey_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryKey_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context, data, holder, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryKey_test_0200  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryKey_test_0200  keyData = " + JSON.stringify(keyData));
          expect(keyData != '').assertTrue();
          done();
        });
      });
      sleep(500);
    });
    /**
     * @tc.number SUB_Telephony_ContactsApi_queryKey_test_0300
     * @tc.name contact::queryKey
     * @tc.desc Function test
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryKey_test_0300", TestType.FUNCTION | Size.SmallTest | Level.LEVEL2, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context, contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryKey_test_0300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryKey_test_0300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.queryKey(context, data, holder);
        promise.then((keyData) => {
          console.info("SUB_Telephony_ContactsApi_queryKey_test_0300  keyData = " + JSON.stringify(keyData));
          expect(keyData != '').assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.info("SUB_Telephony_ContactsApi_queryKey_test_0300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });

  });
}
