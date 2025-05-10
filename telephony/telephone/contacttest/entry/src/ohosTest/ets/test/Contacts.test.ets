/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, it, expect } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';

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

function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

function expectEqual(exp: string | number | boolean, assert: string | number | boolean, info: string = ''): void {
  try {
    expect(exp).assertEqual(assert);
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

function sleep(ms: ESObject = 66): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('')
    }, ms)
  })
}

let ability = async () => {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  const bundleName = abilityDelegatorRegistry.getArguments().bundleName
  const want: Want = {
    bundleName: bundleName,
    abilityName: 'EntryAbility'
  }
  await delegator.startAbility(want);
  await sleep(1000)
}
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

let permission = ['ohos.permission.WRITE_CONTACTS']

export default function ContactsTest() {
  describe('ContactsTest', async (done: Function) => {
    beforeAll(async (done: Function) => {
      console.info("beforeAll case");
      await ability()
      let dr = Driver.create()
      for (let i = 0; i < permission.length; i++) {
        let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500)
        await power?.click()
        await sleep()
      }
      done();
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_0100
     * @tc.name       : testContactAddContactCallBack0100
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testContactAddContactCallBack0100", 0, async (done: Function) => {
      let caseName: string = 'testContactAddContactCallBack0100';
      console.info(`${caseName} test start`);
      try {
        // 获取context
        let context: Context = AppStorage.get('context') as Context;
        await sleep()
        contact.addContact(context, {
          name: {
            fullName: 'zhangSan'
          }, phoneNumbers: [{
            phoneNumber: '138xxxxxxx1'
          }], id: 1
        }, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} Failed to addContact. Code:${JSON.stringify(err)}`)
            ExpectFail();
            done()
          } else {
            console.info(`${caseName} sunccess to addContact. Code:${JSON.stringify(data)}`)
            contact.queryKey(context, data, (keyErr: BusinessError, keyData: string) => {
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
            })
          }
        })
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
        done()
      }
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_0200
     * @tc.name       : testContactAddContactCallBack0200
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testContactAddContactCallBack0200", 0, async (done: Function) => {
      let caseName: string = 'testContactAddContactCallBack0200';
      console.info(`${caseName} test start`);
      try {
        // 获取context
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} Failed to addContact. Code:${JSON.stringify(err)}`)
            ExpectFail();
            done()
          } else {
            console.info(`${caseName} sunccess to addContact. Code:${JSON.stringify(data)}`)
            contact.queryKey(context, data, (keyErr: BusinessError, keyData: string) => {
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
            })
          }
        })
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
        done()
      }
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_0300
     * @tc.name       : testContactAddContactCallBack0300
     * @tc.desc       : Add a contacts and useing the callback method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testContactAddContactCallBack0300", 0, async (done: Function) => {
      let caseName: string = 'testContactAddContactCallBack0300';
      console.info(`${caseName} test start`);
      try {
        // 获取context
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, {}, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} Failed to addContact. Code:${JSON.stringify(err)}`)
            expectEqual(err.code, 401)
            done()
          } else {
            console.info(`${caseName} sunccess to addContact. Code:${JSON.stringify(data)}`)
            contact.queryKey(context, data, (keyErr: BusinessError, keyData: string) => {
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
            })
          }
        })
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
        done()
      }
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_0400
     * @tc.name       : testContactAddContactPromise0100
     * @tc.desc       : Add a contacts and useing the promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testContactAddContactPromise0100", 0, async (done: Function) => {
      let caseName: string = 'testContactAddContactPromise0100';
      console.info(`${caseName} test start`);
      try {
        // 获取context
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, {
          name: {
            fullName: 'LiSi'
          }, phoneNumbers: [{
            phoneNumber: '138xxxxxxx'
          }], id: -1
        }).then((data) => {
          console.info(`${caseName} sunccess to addContact. Code:${JSON.stringify(data)}`)
          contact.queryKey(context, data, (keyErr: BusinessError, keyData: string) => {
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
          })
        }).catch((error: BusinessError) => {
          console.info(`${caseName} Failed to addContact. Code:${JSON.stringify(error)}`)
          ExpectFail();
          done()
        })
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expectTrue(false);
        console.info(`${caseName} test end`);
        done()
      }
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_0500
     * @tc.name       : testContactAddContactPromise0200
     * @tc.desc       : Add a contacts and useing the promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testContactAddContactPromise0200", 0, async (done: Function) => {
      let caseName: string = 'testContactAddContactPromise0200';
      console.info(`${caseName} test start`);
      try {
        // 获取context
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData).then((data) => {
          console.info(`${caseName} sunccess to addContact. Code:${JSON.stringify(data)}`)
          contact.queryKey(context, data, (keyErr: BusinessError, keyData: string) => {
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
          })
        }).catch((error: BusinessError) => {
          console.info(`${caseName} Failed to addContact. Code:${JSON.stringify(error)}`)
          ExpectFail();
          done()
        })
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        ExpectFail();
        console.info(`${caseName} test end`);
        done()
      }
    });

    /**
     * @tc.number     : SUB_Telephony_Contact_AddContact_0600
     * @tc.name       : testContactAddContactPromise0300
     * @tc.desc       : Add a contacts and useing the promise method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testContactAddContactPromise0300", 0, async (done: Function) => {
      let caseName: string = 'testContactAddContactPromise0300';
      console.info(`${caseName} test start`);
      try {
        // 获取context
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, {}).then((data) => {
          console.info(`${caseName} sunccess to addContact. Code:${JSON.stringify(data)}`)
          ExpectFail()
          contact.queryKey(context, data, (keyErr: BusinessError, keyData: string) => {
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
          })
        }).catch((error: BusinessError) => {
          console.info(`${caseName} Failed to addContact. Code:${JSON.stringify(error)}`)
          expect(error.code).assertEqual(401)
          done()
        })
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect().assertFail()
        console.info(`${caseName} test end`);
        done()
      }
    });

  })
}


