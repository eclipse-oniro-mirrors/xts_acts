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

export default function ErrTest() {
  describe('ErrTest', () => {

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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5600
     * @tc.name       : testTelephonyContactQueryContact5600
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.sipAddresses = [{
        sipAddress: "sipAddress",
        labelName: "abcd",
        labelId: contact.SipAddress.INVALID_LABEL_ID
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
                        ExpectTrue(queryData.sipAddresses[0].labelId.toString() === "-1");
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
     * @tc.number     : SUB_Telephony_Contact_AddContact_1100
     * @tc.name       : testTelephonyContactAddContact1100
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    //try catch捕获401,同时接口回调进失败分支
    it('testTelephonyContactAddContact1100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumContact: contact.Contact = {
        name: {
          fullName: ''
        }
      };
      try {
        contact.addContact(context, phoneNumContact, (err: BusinessError, data: number) => {
          if (err) {
            console.log(`${caseName} addContact: err>${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.log(`${caseName} addContact: success data>${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(ee.code === 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number : SUB_Telephony_Contact_AddContact_8700
     * @tc.name   : testTelephonyContactAddContact8700
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact8700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact8700";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.name !== undefined) {
        contactData.name.fullName = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
        contactData.name.middleNamePhonetic = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
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
                  if (resDate.name !== undefined) {
                    let name: contact.Name = resDate.name;
                    if (name.middleNamePhonetic !== undefined) {
                      ExpectTrue(name.fullName.length > 0 && name.middleNamePhonetic.length > 0);
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
     * @tc.number : SUB_Telephony_Contact_AddContact_8800
     * @tc.name   : testTelephonyContactAddContact8800
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact8800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact8800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.name !== undefined) {
        contactData.name.fullName = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
        contactData.name.namePrefix = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
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
                  if (resDate.name !== undefined) {
                    let name: contact.Name = resDate.name;
                    if (name.namePrefix !== undefined) {
                      ExpectTrue(name.fullName.length > 0 && name.namePrefix.length > 0);
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
     * @tc.number : SUB_Telephony_Contact_AddContact_8900
     * @tc.name   : testTelephonyContactAddContact8900
     * @tc.desc   : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactAddContact8900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact8900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.name !== undefined) {
        contactData.name.fullName = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
        contactData.name.nameSuffix = "axdgdfgfhgdjg194986194949848所赋予的不要动不动辨别！#@￥#%￥……%&contact.queryKey()";
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
                  if (resDate.name !== undefined) {
                    let name: contact.Name = resDate.name;
                    if (name.nameSuffix !== undefined) {
                      ExpectTrue(name.fullName.length > 0 && name.nameSuffix.length > 0);
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
     * @tc.number : SUB_Telephony_Contact_QueryContact_10400
     * @tc.name   : testTelephonyContactQueryContact10400
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact10400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact10400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.imAddresses !== undefined) {
        contactData.imAddresses = [{
          imAddress: "imAddress",
          labelName: "",
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
                      ExpectTrue(labelName === undefined);
                    }
                    done();
                  } else {
                    ExpectTrue(true);
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
     * @tc.number : SUB_Telephony_Contact_QueryContact_12800
     * @tc.name   : testTelephonyContactQueryContact12800
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "自定义phoneNumbers", labelId: contact.PhoneNumber.INVALID_LABEL_ID
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
     * @tc.number : SUB_Telephony_Contact_QueryContact_12900
     * @tc.name   : testTelephonyContactQueryContact12900
     * @tc.desc   : Query the key of a contact based on their ID and use the Callback10 method as an asynchronous method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testTelephonyContactQueryContact12900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact12900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      if (contactData.phoneNumbers !== undefined) {
        contactData.phoneNumbers = [{
          phoneNumber: "13800000000", labelName: "", labelId: contact.PhoneNumber.CUSTOM_LABEL
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
                      ExpectTrue(labelName === '');
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_5600
     * @tc.name       : testTelephonyContactQueryContactsByEmail5600
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail5600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail5600";
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
                      if (SipAddress[0].sipAddress !== undefined) {
                        ExpectTrue(SipAddress[0].sipAddress === "sipAddress");
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
      } catch (err) {
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_4600
     * @tc.name       : testTelephonyContactQueryContactsByEmail4600
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail4600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail4600";
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
                      if (PostalAddress[0].country !== undefined) {
                        ExpectTrue(PostalAddress[0].country === "中国");
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_4800
     * @tc.name       : testTelephonyContactQueryContactsByEmail4800
     * @tc.desc       : Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail4800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail4800";
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
                      if (PostalAddress[0].neighborhood !== undefined) {
                        ExpectTrue(PostalAddress[0].neighborhood === "neighborhood");
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_6300
     * @tc.name       : testTelephonyContactQueryContact6300
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact6300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact6300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.emails = [{
        email: "13800000000@email.com",
        labelName: "自定义邮政地址类型",
        labelId: contact.Email.INVALID_LABEL_ID,
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
                ExpectTrue(keyData.length !== 0);
                contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                  if (queryErr) {
                    console.info(`${caseName} callback: err->${JSON.stringify(queryErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContacts:success->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.emails !== undefined) {
                      let email: contact.Email[] = resDate.emails;
                      if (email[0].labelId !== undefined) {
                        ExpectTrue(email[0].labelId.toString() === "-1");
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
     * @tc.number     : SUB_Telephony_Contact_QueryContact_5100
     * @tc.name       : testTelephonyContactQueryContact5100
     * @tc.desc       : Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContact5100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact5100";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contactData.relations = [{
        relationName: "relationName", labelName: "无效的关系类型", labelId: contact.Relation.INVALID_LABEL_ID
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
                        ExpectTrue(queryData.relations[0].labelId.toString() === "-1");
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1600
     * @tc.name       : testTelephonyContactQueryContactsByEmail1600
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1600";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, '13800000000@email.com', {
          attributes: []
        }, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_0300
     * @tc.name       : testTelephonyContactUpdateContact0300
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact0300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact0300";
      console.info(`${caseName} test start `);
      let phoneNumContact: contact.Contact = {
        id: 2, name: {
          fullName: '李四'
        }, phoneNumbers: [{
          phoneNumber: '13800000000'
        }]
      };
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (addErr: BusinessError, addData: number) => {
          if (addErr) {
            console.info(`${caseName} addContact: err->${JSON.stringify(addErr)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
            ExpectTrue(addData > 0);
          }
          console.info(`${caseName} addContact: success data->${JSON.stringify(addData)}`);
          ExpectTrue(addData > 0);
          contact.queryKey(context, addData, (keyErr: BusinessError, keyData: string) => {
            if (keyErr) {
              console.info(`${caseName} queryKey: err->${JSON.stringify(keyErr)}`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
              let con: contact.Contact = 0 as contact.Contact;
              try {
                contact.updateContact(context, con, (updateErr: BusinessError, updateDate: void) => {
                  if (updateErr) {
                    console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                    ExpectFail();
                    done();
                  }
                  console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                });
              } catch (e) {
                console.info(`${caseName} updateContact: catch err->${JSON.stringify(e)}`);
                ExpectTrue((e as BusinessError).code == 401);
                done();
              }
            }
          });
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_0400
     * @tc.name       : testTelephonyContactUpdateContact0400
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact0400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact0400";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.updateContact(context, {}, (updateErr: BusinessError, updateDate: void) => {
          if (updateErr) {
            console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
            // ExpectFail();
            ExpectTrue(updateErr.code === 401);
            done();
          } else {
            console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
            // ExpectTrue(true);
            ExpectFail();
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_0500
     * @tc.name       : testTelephonyContactUpdateContact0500
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact0500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact0500";
      console.info(`${caseName} test start `);
      try {
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
                contact.updateContact(context, {
                  id: 2,
                  key: keyData,
                }, (updateErr: BusinessError, updateDate: void) => {
                  if (updateErr) {
                    console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                    ExpectTrue(updateErr.code === 401);
                    done();
                  } else {
                    console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                    ExpectFail();
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_1500
     * @tc.name       : testTelephonyContactUpdateContact1500
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact1500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact1500";
      console.info(`${caseName} test start `);
      try {
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
                ExpectTrue(keyData.length > 0);
                let con: contact.Contact = 0 as contact.Contact;
                try {
                  contact.updateContact(context, con, {
                    attributes: attr.attributes
                  }, (updateErr: BusinessError, updateDate: void) => {
                    if (updateErr) {
                      console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                      ExpectFail();
                      done();
                    }
                  });
                } catch (e) {
                  console.info(`${caseName} updateContact: catch err->${JSON.stringify(e)}`);
                  ExpectTrue((e as BusinessError).code == 401);
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_1600
     * @tc.name       : testTelephonyContactUpdateContact1600
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact1600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact1600";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.updateContact(context, {}, {
          attributes: attr.attributes
        }, (updateErr: BusinessError, updateDate: void) => {
          if (updateErr) {
            console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
            ExpectTrue(updateErr.code === 401);
            done();
          } else {
            console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
            ExpectFail();
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_1700
     * @tc.name       : testTelephonyContactUpdateContact1700
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact1700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact1700";
      console.info(`${caseName} test start `);
      try {
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
                contact.updateContact(context, {
                  id: 2,
                  key: keyData,
                }, {
                  attributes: attr.attributes
                }, (updateErr: BusinessError, updateDate: void) => {
                  if (updateErr) {
                    console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                    // ExpectFail();
                    ExpectTrue(updateErr.code === 401);
                    done();
                  } else {
                    console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                    // ExpectTrue(true);
                    ExpectFail();
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_2800
     * @tc.name       : testTelephonyContactUpdateContact2800
     * @tc.desc       : Update a contacts and useing the promise10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact2800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact2800";
      console.info(`${caseName} test start `);
      try {
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
                let promise = contact.updateContact(context, {}, attr);
                promise.then((updateDate) => {
                  console.info(`${caseName} updateContact: success data->${updateDate}`);
                  // ExpectTrue(true);
                  ExpectFail();
                  done();
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} updateContact: err->${JSON.stringify(err)}`);
                  // ExpectFail();
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_2900
     * @tc.name       : testTelephonyContactUpdateContact2900
     * @tc.desc       : Update a contacts and useing the promise10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact2900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact2900";
      console.info(`${caseName} test start `);
      try {
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
                let promise = contact.updateContact(context, {
                  id: 2,
                  key: keyData,
                }, {
                  attributes: attr.attributes
                });
                promise.then((updateDate) => {
                  console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                  // ExpectTrue(true);
                  ExpectFail();
                  done();
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} updateContact: err->${JSON.stringify(err)}`);
                  // ExpectFail();
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
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_0400
     * @tc.name       : testTelephonyContactQueryContactsByEmail0400
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail0400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail0400";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, null, (err: BusinessError, data) => {
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
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(ee.code === 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_1200
     * @tc.name       : testTelephonyContactQueryContactsByEmail1200
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail1200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail1200";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, null, holder, (err: BusinessError, data) => {
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
        const ee: BusinessError = err as BusinessError;
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(ee.code === 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_QueryContactsByEmail_3500
     * @tc.name       : testTelephonyContactQueryContactsByEmail3500
     * @tc.desc       : Querying contacts by email using callback method as an asynchronous approach.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactQueryContactsByEmail3500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail3500";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.queryContactsByEmail(context, null, {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, (err: BusinessError, data) => {
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
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue((err as BusinessError).code === 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_DeleteContact_0300
     * @tc.name       : testTelephonyContactDeleteContact0300
     * @tc.desc       : Delete a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactDeleteContact0300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactDeleteContact0300";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.deleteContact(context, '9999', (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} deleteContacts:err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} deleteContacts:success`);
            ExpectFail();
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
     * @tc.number     : SUB_Telephony_Contact_DeleteContact_0400
     * @tc.name       : testTelephonyContactDeleteContact0400
     * @tc.desc       : Delete a contacts and useing the callback method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactDeleteContact0400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactDeleteContact0400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.deleteContact(context, '-9999', (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} deleteContacts:err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
            done();
          } else {
            console.info(`${caseName} deleteContacts:success`);
            ExpectFail();
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
     * @tc.number     : SUB_Telephony_Contact_DeleteContact_0800
     * @tc.name       : testTelephonyContactDeleteContact0800
     * @tc.desc       : Delete a contacts and useing the promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactDeleteContact0800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactDeleteContact0800";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.deleteContact(context, "9999");
        promise.then(() => {
          console.info(`${caseName} deleteContacts:success`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} deleteContacts:fail->${JSON.stringify(err)}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 401);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_DeleteContact_0900
     * @tc.name       : testTelephonyContactDeleteContact0900
     * @tc.desc       : Delete a contacts and useing the promise method as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactDeleteContact0900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactDeleteContact0900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        let promise = contact.deleteContact(context, "-9999");
        promise.then(() => {
          console.info(`${caseName} deleteContacts:success`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} deleteContacts:fail->${JSON.stringify(err)}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 401);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_IsLocalContact_0600
     * @tc.name       : testTelephonyContactIsLocalContact0600
     * @tc.desc       : Determine if the current contact ID is in the phone book and use callback as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactIsLocalContact0600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact0600";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      try {
        contact.isLocalContact(context, 0, (err: BusinessError<void>, data: boolean) => {
          if (err) {
            console.log(`${caseName} isLocalContact: err>${JSON.stringify(err)}`);
            ExpectTrue(err.code === 401);
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
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_IsLocalContact_1400
     * @tc.name       : testTelephonyContactIsLocalContact1400
     * @tc.desc       : Determine if the current contact ID is in the phone book and use Promise as an asynchronous method 10+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactIsLocalContact1400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact1400";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let promise = contact.isLocalContact(context, 0);
        promise.then((data: boolean) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectTrue(data === false);
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
    });


  });
}