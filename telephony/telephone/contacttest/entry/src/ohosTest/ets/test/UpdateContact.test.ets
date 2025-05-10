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

export default function UpdateContactTest() {
  describe('UpdateContactTest', () => {

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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_0100
     * @tc.name       : testTelephonyContactUpdateContact0100
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactUpdateContact0100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact0100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        console.info(JSON.stringify(contactData))
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
                let phoneNumContact: contact.Contact = {
                  id: addData,
                  key: keyData,
                  emails: [{
                    email: "13800000001@email.com",
                    labelName: "自定义邮箱",
                    labelId: 1,
                    displayName: "emailDisplayName"
                  }]
                };
                contact.updateContact(context, phoneNumContact, (updateErr: BusinessError, updateDate: void) => {
                  if (updateErr) {
                    console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                    contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                      if (queryErr) {
                        console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                        let resDate: contact.Contact = queryData;
                        if (resDate.emails !== undefined) {
                          let emails: contact.Email[] = resDate.emails
                          if (emails[0].email !== undefined) {
                            let email: string = emails[0].email;
                            ExpectTrue(email === "13800000001@email.com");
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_0600
     * @tc.name       : testTelephonyContactUpdateContact0600
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact0600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact0600";
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
                ExpectTrue(keyData.length > 0)
                contact.updateContact(context, {
                  id: addData,
                  key: keyData,
                  name: {
                    fullName: "小李部分更新",
                  },
                }, (updateErr: BusinessError, updateDate: void) => {
                  if (updateErr) {
                    console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                    contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                      if (queryErr) {
                        console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                        let resDate: contact.Contact = queryData;
                        if (resDate.name !== undefined) {
                          let name: contact.Name = resDate.name
                          ExpectTrue(name.fullName === "小李部分更新");
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_0700
     * @tc.name       : testTelephonyContactUpdateContact0700
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact0700', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact0700";
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
                expect(false).assertTrue();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(keyData)}`);
                contact.queryContact(context, keyData, (queryErrOne: BusinessError, queryDataOne: contact.Contact) => {
                  if (queryErrOne) {
                    console.info(`${caseName} queryContactOne: err->${JSON.stringify(queryErrOne)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContactOne: success data->${JSON.stringify(queryDataOne)}`);
                    contact.updateContact(context, {
                      id: addData,
                      key: keyData,
                      name: {
                        fullName: "小李",
                      },
                    }, (updateErr: BusinessError, updateDate: void) => {
                      if (updateErr) {
                        console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                        contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                          if (queryErr) {
                            console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                            ExpectFail();
                            done();
                          } else {
                            console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                            let resDateOne: contact.Contact = queryDataOne;
                            let resDate: contact.Contact = queryData;
                            if (resDateOne.name !== undefined && resDate.name !== undefined) {
                              let nameOne: contact.Name = resDateOne.name
                              let name: contact.Name = resDate.name
                              ExpectTrue(nameOne.fullName === name.fullName);
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_0800
     * @tc.name       : testTelephonyContactUpdateContact0800
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact0800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact0800";
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
              contact.updateContact(context, {
                id: addData,
                key: keyData,
                name: {
                  fullName: "小李啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊",
                },
              }, (updateErr: BusinessError, updateDate: void) => {
                if (updateErr) {
                  console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                  contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                    if (queryErr) {
                      console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                      if (queryData.name !== undefined) {
                        ExpectTrue(queryData.name.fullName.length > 0);
                        done();
                      }
                    }
                  });
                }
              });
            }
          });
        }
      });
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_0900
     * @tc.name       : testTelephonyContactUpdateContact0900
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact0900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact0900";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err: BusinessError, dataID: number) => {
          if (err) {
            console.info(`${caseName} addContact: err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.info(`${caseName} addContact: success data->${JSON.stringify(dataID)}`);
            ExpectTrue(dataID > 0);
            contact.queryKey(context, dataID, (err: BusinessError, data: string) => {
              if (err) {
                console.info(`${caseName} queryKey: err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} queryKey: success data->${JSON.stringify(data)}`);
                ExpectTrue(data.length > 0);
                contact.updateContact(context, {
                  id: dataID,
                  key: data,
                  phoneNumbers: [{
                    phoneNumber: "13800000000", labelName: "自定义phoneNumbers0"
                  }, {
                    phoneNumber: "13800000001", labelName: "自定义phoneNumbers1"
                  }, {
                    phoneNumber: "13800000002", labelName: "自定义phoneNumbers2"
                  }, {
                    phoneNumber: "13800000003", labelName: "自定义phoneNumbers3"
                  }, {
                    phoneNumber: "13800000004", labelName: "自定义phoneNumbers4"
                  }, {
                    phoneNumber: "13800000005", labelName: "自定义phoneNumbers5"
                  }],
                }, (updateErr: BusinessError, updateDate: void) => {
                  if (updateErr) {
                    console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                    ExpectTrue(true);
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_1100
     * @tc.name       : testTelephonyContactUpdateContact1100
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact1100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact1100";
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
                contact.updateContact(context, {
                  id: addData,
                  key: keyData,
                  phoneNumbers: [{
                    phoneNumber: "029-1234567"
                  }],
                }, (updateErr: BusinessError, updateDate: void) => {
                  if (updateErr) {
                    console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                    ExpectTrue(true);
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_1200
     * @tc.name       : testTelephonyContactUpdateContact1200
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact1200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact1200";
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
              contact.updateContact(context, {
                id: addData,
                key: keyData,
                phoneNumbers: [{
                  phoneNumber: "10086"
                }],
              }, (updateErr: BusinessError, updateDate: void) => {
                if (updateErr) {
                  console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                  contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                    if (queryErr) {
                      console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                      let resDate: contact.Contact = queryData;
                      if (resDate.phoneNumbers !== undefined) {
                        let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers
                        if (phoneNumbers[0].phoneNumber !== undefined) {
                          let phoneNumber = phoneNumbers[0].phoneNumber
                          ExpectTrue(phoneNumber === "10086");
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
        }
      });
      console.info(`${caseName} test start`);
    });


    /**
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_1300
     * @tc.name       : testTelephonyContactUpdateContact1300
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactUpdateContact1300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact1300";
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
                  id: addData,
                  key: keyData,
                  emails: [{
                    email: "13800000001@email.com",
                    labelName: "自定义邮箱",
                    labelId: 1,
                    displayName: "emailDisplayName"
                  }]
                }, {
                  attributes: attr.attributes
                }, (updateErr: BusinessError, updateDate: void) => {
                  if (updateErr) {
                    console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                    contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                      if (queryErr) {
                        console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                        let resDate: contact.Contact = queryData;
                        if (resDate.emails !== undefined) {
                          let emails: contact.Email[] = resDate.emails
                          if (emails[0].email !== undefined) {
                            let email: string = emails[0].email;
                            ExpectTrue(email === "13800000001@email.com");
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_1800
     * @tc.name       : testTelephonyContactUpdateContact1800
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact1800', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact1800";
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
                  id: addData,
                  key: keyData,
                  name: {
                    fullName: "小李部分更新",
                  },
                }, {
                  attributes: attr.attributes
                }, (updateErr: BusinessError, updateDate: void) => {
                  if (updateErr) {
                    console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                    ExpectTrue(true);
                    contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                      if (queryErr) {
                        console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                        let resDate: contact.Contact = queryData;
                        if (resDate.name !== undefined) {
                          let name: contact.Name = resDate.name
                          ExpectTrue(name.fullName === "小李部分更新");
                          done();
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_1900
     * @tc.name       : testTelephonyContactUpdateContact1900
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact1900', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact1900";
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
                contact.queryContact(context, keyData, (queryErrOne: BusinessError, queryDataOne: contact.Contact) => {
                  if (queryErrOne) {
                    console.info(`${caseName} queryContactOne: err->${JSON.stringify(queryErrOne)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContactOne: success data->${JSON.stringify(queryDataOne)}`);
                    contact.updateContact(context, {
                      id: addData,
                      key: keyData,
                      name: {
                        fullName: "小李",
                      },
                    }, {
                      attributes: attr.attributes
                    }, (updateErr: BusinessError, updateDate: void) => {
                      if (updateErr) {
                        console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                        contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                          if (queryErr) {
                            console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                            ExpectFail();
                            done();
                          } else {
                            console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                            let resDateOne: contact.Contact = queryDataOne;
                            let resDate: contact.Contact = queryData;
                            if (resDateOne.name !== undefined && resDate.name !== undefined) {
                              let nameOne: contact.Name = resDateOne.name
                              let name: contact.Name = resDate.name
                              ExpectTrue(nameOne.fullName === name.fullName);
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
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} end`);
    });
    /**
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_2000
     * @tc.name       : testTelephonyContactUpdateContact2000
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact2000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact2000";
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
                  id: addData,
                  key: keyData,
                  name: {
                    fullName: "小李啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊",
                  },
                }, {
                  attributes: attr.attributes
                }, (updateErr: BusinessError, updateDate: void) => {
                  if (updateErr) {
                    console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                    ExpectTrue(true);
                    contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                      if (queryErr) {
                        console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                        if (queryData.name !== undefined) {
                          ExpectTrue(queryData.name.fullName.length > 0);
                          done();
                        }
                      }
                    });
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_2100
     * @tc.name       : testTelephonyContactUpdateContact2100
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact2100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact2100";
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
                  id: addData,
                  key: keyData,
                  phoneNumbers: [{
                    phoneNumber: "13800000000", labelName: "自定义phoneNumbers0"
                  }, {
                    phoneNumber: "13800000001", labelName: "自定义phoneNumbers1"
                  }, {
                    phoneNumber: "13800000002", labelName: "自定义phoneNumbers2"
                  }, {
                    phoneNumber: "13800000003", labelName: "自定义phoneNumbers3"
                  }, {
                    phoneNumber: "13800000004", labelName: "自定义phoneNumbers4"
                  }, {
                    phoneNumber: "13800000005", labelName: "自定义phoneNumbers5"
                  }],
                }, {
                  attributes: attr.attributes
                }, (updateErr: BusinessError, updateDate: void) => {
                  if (updateErr) {
                    console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                    ExpectTrue(true);
                    contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                      if (queryErr) {
                        console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                        let resDate: contact.Contact = queryData;
                        if (resDate.phoneNumbers !== undefined) {
                          let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers
                          if (phoneNumbers.length > 1) {
                            ExpectTrue(phoneNumbers.length === 6);
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_2200
     * @tc.name       : testTelephonyContactUpdateContact2200
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact2200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact2200";
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
                ExpectTrue(true);
                contact.updateContact(context, {
                  id: addData,
                  key: keyData,
                  phoneNumbers: [{
                    phoneNumber: "110"
                  }],
                }, {
                  attributes: attr.attributes
                }, (updateErr: BusinessError, updateDate: void) => {
                  if (updateErr) {
                    console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                    contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                      if (queryErr) {
                        console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                        let resDate: contact.Contact = queryData;
                        if (resDate.phoneNumbers !== undefined) {
                          let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers
                          if (phoneNumbers[0].phoneNumber !== undefined) {
                            let phoneNumber = phoneNumbers[0].phoneNumber
                            ExpectTrue(phoneNumber === "110");
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_2300
     * @tc.name       : testTelephonyContactUpdateContact2300
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact2300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact2300";
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
                ExpectTrue(true);
                contact.updateContact(context, {
                  id: addData,
                  key: keyData,
                  phoneNumbers: [{
                    phoneNumber: "029-1234567"
                  }],
                }, {
                  attributes: attr.attributes
                }, (updateErr: BusinessError, updateDate: void) => {
                  if (updateErr) {
                    console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                    contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                      if (queryErr) {
                        console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                        ExpectFail();
                        done();
                      } else {
                        console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                        let resDate: contact.Contact = queryData;
                        if (resDate.phoneNumbers !== undefined) {
                          let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers
                          if (phoneNumbers[0].phoneNumber !== undefined) {
                            let phoneNumber = phoneNumbers[0].phoneNumber
                            ExpectTrue(phoneNumber === "029-1234567");
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_2400
     * @tc.name       : testTelephonyContactUpdateContact2400
     * @tc.desc       : Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact2400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact2400";
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
                ExpectTrue(true);
                contact.updateContact(context, {
                  id: addData,
                  key: keyData,
                  phoneNumbers: [{
                    phoneNumber: "10086"
                  }],
                }, {
                  attributes: attr.attributes
                }, (updateErr: BusinessError, updateDate: void) => {
                  if (updateErr) {
                    console.info(`${caseName} updateContact: err->${JSON.stringify(updateErr)}`);
                    ExpectFail();
                    done();
                  }
                  console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                  contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                    if (queryErr) {
                      console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                      ExpectFail();
                      done();
                    }
                    console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                    let resDate: contact.Contact = queryData;
                    if (resDate.phoneNumbers !== undefined) {
                      let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers
                      if (phoneNumbers[0].phoneNumber !== undefined) {
                        let phoneNumber = phoneNumbers[0].phoneNumber
                        ExpectTrue(phoneNumber === "10086");
                        done();
                      }
                    } else {
                      ExpectFail();
                      done();
                    }
                  });
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_2500
     * @tc.name       : testTelephonyContactUpdateContact2500
     * @tc.desc       : Update a contacts and useing the promise10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTelephonyContactUpdateContact2500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact2500";
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
                ExpectTrue(true);
                let promise = contact.updateContact(context, {
                  id: addData,
                  key: keyData,
                  emails: [{
                    email: "13800000001@email.com",
                    labelName: "自定义邮箱",
                    labelId: 1,
                    displayName: "emailDisplayName"
                  }]
                }, {
                  attributes: attr.attributes
                });
                promise.then((updateDate) => {
                  console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                  contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                    if (queryErr) {
                      console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                      let resDate: contact.Contact = queryData;
                      if (resDate.emails !== undefined) {
                        let emails: contact.Email[] = resDate.emails
                        if (emails[0].email !== undefined) {
                          let email: string = emails[0].email;
                          ExpectTrue(email === "13800000001@email.com");
                          done();
                        }
                      } else {
                        ExpectFail();
                        done();
                      }
                    }
                  });
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} updateContact: err->${JSON.stringify(err)}`);
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
      console.info(`${caseName} end`);
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_3000
     * @tc.name       : testTelephonyContactUpdateContact3000
     * @tc.desc       : Update a contacts and useing the promise10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact3000', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact3000";
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
                  id: addData,
                  key: keyData,
                  name: {
                    fullName: "小李部分更新",
                  },
                }, {
                  attributes: attr.attributes
                });
                promise.then((updateDate) => {
                  console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                  ExpectTrue(true);
                  contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                    if (queryErr) {
                      console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                      let resDate: contact.Contact = queryData;
                      if (resDate.name !== undefined) {
                        let name: contact.Name = resDate.name
                        ExpectTrue(name.fullName === "小李部分更新");
                        done();
                      } else {
                        ExpectFail();
                        done();
                      }
                    }
                  });
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} updateContact: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_3100
     * @tc.name       : testTelephonyContactUpdateContact3100
     * @tc.desc       : Update a contacts and useing the promise10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact3100', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact3100";
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
                contact.queryContact(context, keyData, (queryErrOne: BusinessError, queryDataOne: contact.Contact) => {
                  if (queryErrOne) {
                    console.info(`${caseName} queryContactOne: err->${JSON.stringify(queryErrOne)}`);
                    ExpectFail();
                    done();
                  } else {
                    console.info(`${caseName} queryContactOne: success data->${JSON.stringify(queryDataOne)}`);
                    let promise = contact.updateContact(context, {
                      id: addData,
                      key: keyData,
                      name: {
                        fullName: "小李",
                      },
                    }, {
                      attributes: attr.attributes
                    });
                    promise.then((updateDate) => {
                      console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                      contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                        if (queryErr) {
                          console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                          ExpectFail();
                          done();
                        } else {
                          console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                          let resDateOne: contact.Contact = queryDataOne;
                          let resDate: contact.Contact = queryData;
                          if (resDateOne.name !== undefined && resDate.name !== undefined) {
                            let nameOne: contact.Name = resDateOne.name
                            let name: contact.Name = resDate.name
                            ExpectTrue(nameOne.fullName === name.fullName);
                            done();
                          } else {
                            ExpectFail();
                            done();
                          }
                        }
                      });
                    }).catch((err: BusinessError) => {
                      console.info(`${caseName} updateContact: err->${JSON.stringify(err)}`);
                      ExpectFail();
                      done();
                    });
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_3200
     * @tc.name       : testTelephonyContactUpdateContact3200
     * @tc.desc       : Update a contacts and useing the promise10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact3200', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact3200";
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
                  id: addData,
                  key: keyData,
                  name: {
                    fullName: "小李啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊",
                  },
                }, {
                  attributes: attr.attributes
                });
                promise.then((updateDate) => {
                  console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
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
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} updateContact: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_3300
     * @tc.name       : testTelephonyContactUpdateContact3300
     * @tc.desc       : Update a contacts and useing the promise10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact3300', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact3300";
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
                  id: addData,
                  key: keyData,
                  phoneNumbers: [{
                    phoneNumber: "13800000000", labelName: "自定义phoneNumbers0"
                  }, {
                    phoneNumber: "13800000001", labelName: "自定义phoneNumbers1"
                  }, {
                    phoneNumber: "13800000002", labelName: "自定义phoneNumbers2"
                  }, {
                    phoneNumber: "13800000003", labelName: "自定义phoneNumbers3"
                  }, {
                    phoneNumber: "13800000004", labelName: "自定义phoneNumbers4"
                  }, {
                    phoneNumber: "13800000005", labelName: "自定义phoneNumbers5"
                  }],
                }, {
                  attributes: attr.attributes
                });
                promise.then((updateDate) => {
                  console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                  contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                    if (queryErr) {
                      console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                      let resDate: contact.Contact = queryData;
                      if (resDate.phoneNumbers !== undefined) {
                        let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers
                        if (phoneNumbers.length > 1) {
                          ExpectTrue(true);
                          done();
                        }
                      } else {
                        ExpectFail();
                        done();
                      }
                    }
                  });
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} updateContact: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_3400
     * @tc.name       : testTelephonyContactUpdateContact3400
     * @tc.desc       : Update a contacts and useing the promise10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact3400', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact3400";
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
                  id: addData,
                  key: keyData,
                  phoneNumbers: [{
                    phoneNumber: "110"
                  }],
                }, {
                  attributes: attr.attributes
                });
                promise.then((updateDate) => {
                  console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                  contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                    if (queryErr) {
                      console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                      let resDate: contact.Contact = queryData;
                      if (resDate.phoneNumbers !== undefined) {
                        let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers
                        if (phoneNumbers[0].phoneNumber !== undefined) {
                          let phoneNumber = phoneNumbers[0].phoneNumber
                          ExpectTrue(phoneNumber === "110");
                          done();
                        }
                      } else {
                        ExpectFail();
                        done();
                      }
                    }
                  });
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} updateContact: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_3500
     * @tc.name       : testTelephonyContactUpdateContact3500
     * @tc.desc       : Update a contacts and useing the promise10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact3500', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact3500";
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
                  id: addData,
                  key: keyData,
                  phoneNumbers: [{
                    phoneNumber: "029-1234567"
                  }],
                }, {
                  attributes: attr.attributes
                });
                promise.then((updateDate) => {
                  console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                  contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                    if (queryErr) {
                      console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                      let resDate: contact.Contact = queryData;
                      if (resDate.phoneNumbers !== undefined) {
                        let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers
                        if (phoneNumbers[0].phoneNumber !== undefined) {
                          let phoneNumber = phoneNumbers[0].phoneNumber
                          ExpectTrue(phoneNumber === "029-1234567");
                          done();
                        }
                      } else {
                        ExpectFail();
                        done();
                      }
                    }
                  });
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} updateContact: err->${JSON.stringify(err)}`);
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
     * @tc.number     : SUB_Telephony_Contact_UpdateContact_3600
     * @tc.name       : testTelephonyContactUpdateContact3600
     * @tc.desc       : Update a contacts and useing the promise10 method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testTelephonyContactUpdateContact3600', 0, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact3600";
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
                let promise = contact.updateContact(context, {
                  id: addData,
                  key: keyData,
                  phoneNumbers: [{
                    phoneNumber: "10086"
                  }],
                }, {
                  attributes: attr.attributes
                });
                promise.then((updateDate) => {
                  console.info(`${caseName} updateContact: success data->${JSON.stringify(updateDate)}`);
                  contact.queryContact(context, keyData, (queryErr: BusinessError, queryData: contact.Contact) => {
                    if (queryErr) {
                      console.info(`${caseName} queryContact: err->${JSON.stringify(queryErr)}`);
                      ExpectFail();
                      done();
                    } else {
                      console.info(`${caseName} queryContact: success data->${JSON.stringify(queryData)}`);
                      let resDate: contact.Contact = queryData;
                      if (resDate.phoneNumbers !== undefined) {
                        let phoneNumbers: contact.PhoneNumber[] = resDate.phoneNumbers
                        if (phoneNumbers[0].phoneNumber !== undefined) {
                          let phoneNumber = phoneNumbers[0].phoneNumber
                          ExpectTrue(phoneNumber === "10086");
                          done();
                        }
                      } else {
                        ExpectFail();
                        done();
                      }
                    }
                  });
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} updateContact: err->${JSON.stringify(err)}`);
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


  })
}