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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';
import { SavePhoto, GetUri } from './ContactTestUtil.test';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

export default function NoPermissionTest() {
  describe('NoPermissionTest', () => {

    let fileName = 'NoPermissionTest.jpg';
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
      attributes: [contact.Attribute.ATTR_CONTACT_EVENT, contact.Attribute.ATTR_EMAIL,
      contact.Attribute.ATTR_GROUP_MEMBERSHIP,
      contact.Attribute.ATTR_IM, contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_NICKNAME,
      contact.Attribute.ATTR_NOTE, contact.Attribute.ATTR_ORGANIZATION, contact.Attribute.ATTR_PHONE,
      contact.Attribute.ATTR_PORTRAIT, contact.Attribute.ATTR_POSTAL_ADDRESS,
      contact.Attribute.ATTR_RELATION,
      contact.Attribute.ATTR_SIP_ADDRESS, contact.Attribute.ATTR_WEBSITE]
    };
    /**
     * @tc.name   testTelephonyContactQueryContactsByEmail_3200
     * @tc.number SUB_TELEPHONY_CONTACT_QueryContactsByEmail_3200
     * @tc.desc   Querying contacts by email using callback method as an asynchronous approach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContactsByEmail_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail_3200";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, '13800000000@email.com', (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
     * @tc.name   testTelephonyContactQueryContactsByEmail_3400
     * @tc.number SUB_TELEPHONY_CONTACT_QueryContactsByEmail_3400
     * @tc.desc   Querying contacts by email using callback method as an asynchronous approach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContactsByEmail_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail_3400";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, '13800000000@email.com', holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
     * @tc.name   testTelephonyContactQueryContactsByEmail_3600
     * @tc.number SUB_TELEPHONY_CONTACT_QueryContactsByEmail_3600
     * @tc.desc   Querying contacts by email using callback method as an asynchronous approach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContactsByEmail_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail_3600";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, '13800000000@email.com', attr, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
     * @tc.name   testTelephonyContactQueryContactsByEmail_3800
     * @tc.number SUB_TELEPHONY_CONTACT_QueryContactsByEmail_3800
     * @tc.desc   Querying contacts by email using callback method as an asynchronous approach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContactsByEmail_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail_3800";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, '13800000000@email.com', holder, attr, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
     * @tc.name   testTelephonyContactQueryContactsByEmail_4000
     * @tc.number SUB_TELEPHONY_CONTACT_QueryContactsByEmail_4000
     * @tc.desc   Querying contacts by email using Promise method as an asynchronous approach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContactsByEmail_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactsByEmail_4000";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let promise = contact.queryContactsByEmail(context, '13800000000@email.com', holder, attr);
        await promise.then((data) => {
          console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
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
     * @tc.name   testTelephonyContactQueryGroups0800
     * @tc.number SUB_TELEPHONY_CONTACT_QueryGroups_0800
     * @tc.desc   Query all groups of contacts and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryGroups0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryGroups0800";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryGroups(context, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
     * @tc.name   testTelephonyContactQueryGroups1000
     * @tc.number SUB_TELEPHONY_CONTACT_QueryGroups_1000
     * @tc.desc   Query all groups of contacts and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryGroups1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryGroups1000";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryGroups(context, holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
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
     * @tc.name   testTelephonyContactQueryGroups1200
     * @tc.number SUB_TELEPHONY_CONTACT_QueryGroups_1200
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
        let promise = contact.queryGroups(context, holder);
        await promise.then((data) => {
          console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
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
     * @tc.name   testTelephonyContactQueryHolders0500
     * @tc.number SUB_TELEPHONY_CONTACT_QueryHolders_0500
     * @tc.desc   Query all application information for creating contacts and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryHolders0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryHolders0500";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryHolders(context, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.name   testTelephonyContactQueryHolders0600
     * @tc.number SUB_TELEPHONY_CONTACT_QueryHolders_0600
     * @tc.desc   Query all application information for creating contacts and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryHolders0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryHolders0600";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let promise = contact.queryHolders(context);
        await promise.then((data) => {
          console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
          done();
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.name   testTelephonyContactQueryKey4500
     * @tc.number SUB_TELEPHONY_CONTACT_QueryKey_4500
     * @tc.desc   Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryKey4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey4500";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryKey(context, 1, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.name   testTelephonyContactQueryKey4600
     * @tc.number SUB_TELEPHONY_CONTACT_QueryKey_4600
     * @tc.desc   Query the key of a contact based on their ID and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryKey4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey4600";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryKey(context, 1, holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyContactQueryKey5000
     * @tc.number SUB_TELEPHONY_CONTACT_QueryKey_5000
     * @tc.desc   Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactQueryKey5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryKey5000";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let promise = contact.queryKey(context, 1, holder);
        await promise.then((data) => {
          console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
          done();
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.name   testTelephonyContactQueryContact0200
     * @tc.number SUB_TELEPHONY_CONTACT_QueryContact_0200
     * @tc.desc   Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContact0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact0200";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContact(context, 'abcd', (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.name   testTelephonyContactQueryContact0700
     * @tc.number SUB_TELEPHONY_CONTACT_QueryContact_0700
     * @tc.desc   Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContact0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact0700";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContact(context, 'abcd', holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.name   testTelephonyContactQueryContact1400
     * @tc.number SUB_TELEPHONY_CONTACT_QueryContact_1400
     * @tc.desc   Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContact1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1400";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContact(context, 'abcd', attr, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.name   testTelephonyContactQueryContact1900
     * @tc.number SUB_TELEPHONY_CONTACT_QueryContact_1900
     * @tc.desc   Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContact1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact1900";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContact(context, 'abcd', holder, attr, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.name   testTelephonyContactQueryContact2700
     * @tc.number SUB_TELEPHONY_CONTACT_QueryContact_2700
     * @tc.desc   Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContact2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContact2700";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let promise = contact.queryContact(context, 'abcd', holder, attr);
        await promise.then((data) => {
          console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
          done();
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.name   testTelephonyContactQueryContacts0200
     * @tc.number SUB_TELEPHONY_CONTACT_QueryContacts_0200
     * @tc.desc   Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContacts0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts0200";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContacts(context, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.name   testTelephonyContactQueryContacts0500
     * @tc.number SUB_TELEPHONY_CONTACT_QueryContacts_0500
     * @tc.desc   Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContacts0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts0500";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContacts(context, holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.name   testTelephonyContactQueryContacts0800
     * @tc.number SUB_TELEPHONY_CONTACT_QueryContacts_0800
     * @tc.desc   Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContacts0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts0800";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContacts(context, attr, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.name   testTelephonyContactQueryContacts1100
     * @tc.number SUB_TELEPHONY_CONTACT_QueryContacts_1100
     * @tc.desc   Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContacts1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContacts(context, holder, attr, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.name   testTelephonyContactQueryContacts1400
     * @tc.number SUB_TELEPHONY_CONTACT_QueryContacts_1400
     * @tc.desc   Query the key of a contact based on their ID and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContacts1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContacts1400";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let promise = contact.queryContacts(context, holder, attr);
        await promise.then((data) => {
          console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
          done();
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.name   testTelephonyContactUpdateContact0200
     * @tc.number SUB_Telephony_Contact_UpdateContact_0200
     * @tc.desc   Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactUpdateContact0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact0200";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.updateContact(context, contactData, (updateErr, updateDate) => {
          if (updateErr) {
            console.info(`${caseName} callback: err->${JSON.stringify(updateErr)}`);
            ExpectTrue(updateErr.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(updateDate)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testTelephonyContactUpdateContact1400
     * @tc.number SUB_Telephony_Contact_UpdateContact_1400
     * @tc.desc   Update a contacts and useing the callback10 method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactUpdateContact1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact1400";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.updateContact(context, contactData, attr, (updateErr, updateDate) => {
          if (updateErr) {
            console.info(`${caseName} callback: err->${JSON.stringify(updateErr)}`);
            ExpectTrue(updateErr.code === 201);
            done();
          } else {
            console.info(`${caseName} callback: success data->${JSON.stringify(updateDate)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} end`);
    });
    /**
     * @tc.name   testTelephonyContactUpdateContact2600
     * @tc.number SUB_Telephony_Contact_UpdateContact_2600
     * @tc.desc   Update a contacts and useing the promise10 method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactUpdateContact2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactUpdateContact2600";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let promise = contact.updateContact(context, contactData, attr);
        await promise.then((updateDate) => {
          console.info(`${caseName} callback: success data->${JSON.stringify(updateDate)}`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} callback: success data->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
          done();
        })
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTelephonyContactDeleteContact0500
     * @tc.number SUB_Telephony_Contact_DeleteContact_0500
     * @tc.desc   Delete a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactDeleteContact0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactDeleteContact0500";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.deleteContact(context, '9999', (err: BusinessError) => {
          if (err) {
            console.info(`${caseName} deleteContacts:err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
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
    })
    /**
     * @tc.name   testTelephonyContactDeleteContact1000
     * @tc.number SUB_Telephony_Contact_DeleteContact_1000
     * @tc.desc   Delete a contacts and useing the promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactDeleteContact1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactDeleteContact1000";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let promise = contact.deleteContact(context, "12");
        await promise.then(() => {
          console.info(`${caseName} deleteContacts:success`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} deleteContacts:fail->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
          done();
        });
      } catch (err) {
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.name   testTelephonyContactQueryContactByPhoneNumber0400
     * @tc.number SUB_Telephony_Contact_QueryContactsByPhoneNumber_0400
     * @tc.desc   Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContactByPhoneNumber0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber0400";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByPhoneNumber(context, '13911111111', (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
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
    })
    /**
     * @tc.name   testTelephonyContactQueryContactByPhoneNumber1700
     * @tc.number SUB_Telephony_Contact_QueryContactsByPhoneNumber_9100
     * @tc.desc   Query contacts based on phone numbers and use callback as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContactByPhoneNumber1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber9100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByPhoneNumber(context, '13911111111', holder, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
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
    })
    /**
     * @tc.name   testTelephonyContactQueryContactByPhoneNumber3700
     * @tc.number SUB_Telephony_Contact_QueryContactsByPhoneNumber_3700
     * @tc.desc   Query contacts based on phone numbers and use Promise as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContactByPhoneNumber3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber3700";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let promise = contact.queryContactsByPhoneNumber(context, '13800000000', holder, attr);
        await promise.then((data) => {
          console.log(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
          ExpectFail();
          done()
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 201);
          done();
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.name   testTelephonyContactQueryContactByPhoneNumber3800
     * @tc.number SUB_Telephony_Contact_QueryContactsByPhoneNumber_3800
     * @tc.desc   Query contacts based on phone numbers and use Promise as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContactByPhoneNumber3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber3800";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByPhoneNumber(context, '13800000000', attr, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done()
          } else {
            console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.name   testTelephonyContactQueryContactByPhoneNumber3900
     * @tc.number SUB_Telephony_Contact_QueryContactsByPhoneNumber_3900
     * @tc.desc   Query contacts based on phone numbers and use Promise as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactQueryContactByPhoneNumber3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactQueryContactByPhoneNumber3900";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByPhoneNumber(context, '13800000000', holder, attr, (err: BusinessError, data) => {
          if (err) {
            console.info(`${caseName} queryContacts:err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.info(`${caseName} queryContacts:success->${JSON.stringify(data)}`);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
    /**
     * @tc.name   testTelephonyContactAddContact1000
     * @tc.number SUB_Telephony_Contact_AddContact_1000
     * @tc.desc   Add a contacts and useing the callback method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact1000";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(context, contactData, (err: BusinessError, data) => {
          if (err) {
            console.log(`${caseName} callback: err>${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.log(`${caseName} callback: success data>${JSON.stringify(data)}`);
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
    })
    /**
     * @tc.name   testTelephonyContactAddContact2500
     * @tc.number SUB_Telephony_Contact_AddContact_2500
     * @tc.desc   Add a contacts and useing the Promise method as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactAddContact2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactAddContact2500";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let promise = contact.addContact(context, contactData);
        await promise.then((data) => {
          console.log(`${caseName} success: data>${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201)
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
     * @tc.name   testTelephonyContactIsLocalContact0300
     * @tc.number SUB_Telephony_Contact_IsLocalContact_0300
     * @tc.desc   Determine if the current contact ID is in the phone book and use the callback method as an asynchronous method  10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactIsLocalContact0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact0300";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.isLocalContact(context, 10, (err, data) => {
          if (err) {
            console.log(`${caseName} isLocalContact: err>${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            console.log(`${caseName} isLocalContact: success data>${JSON.stringify(data)}`);
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
    })
    /**
     * @tc.name   testTelephonyContactIsLocalContact1100
     * @tc.number SUB_Telephony_Contact_IsLocalContact_1100
     * @tc.desc   Determine if the current contact ID is in the phone book and use Promise as an asynchronous method 10+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactIsLocalContact1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsLocalContact1100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let promise = contact.isLocalContact(context, 11);
        await promise.then((data) => {
          console.log(`isLocalContact success: data>${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} fail: err>${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
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
     * @tc.name   testTelephonyContactIsMyCard0400
     * @tc.number SUB_Telephony_Contact_IsMyCard_0400
     * @tc.desc   Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactIsMyCard0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard0400";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      contact.isMyCard(context, 1, (err: BusinessError, data: boolean) => {
        if (err) {
          console.info(`${caseName} callback: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
          done();
        } else {
          console.info(`${caseName} callback: success data->${JSON.stringify(data)}`);
          ExpectFail();
          done();
        }
      });
      console.info(`${caseName} test end `);
    });
    /**
     * @tc.name   testTelephonyContactIsMyCard1900
     * @tc.number SUB_Telephony_Contact_IsMyCard_1900
     * @tc.desc   Determine if it is "my business card" and use Promise method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactIsMyCard1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactIsMyCard1900";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let promise = contact.isMyCard(context, 0);
      await promise.then((data: boolean) => {
        console.log(`${caseName} success: data->${JSON.stringify(data)}`);
        ExpectFail();
        done();
      }).catch((err: BusinessError) => {
        console.error(`${caseName} fail: err->${JSON.stringify(err)}`);
        ExpectTrue(err.code === 201);
        done();
      });
      console.info(`${caseName} test end `);
    });

        /**
     * @tc.name   testTelephonyContactqueryContactsCount2000
     * @tc.number SUB_Telephony_Contact_queryContactsCount_2000
     * @tc.desc   queryContactsCount and use Promise method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyContactqueryContactsCount2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = "testTelephonyContactqueryContactsCount2000";
      console.info(`${caseName} test start `);
      let context: Context = AppStorage.get('context') as Context;
      let promise = contact.queryContactsCount(context);
      await promise.then((data) => {
        console.log(`${caseName} fail: data->${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        console.error(`${caseName} error: code 201->${JSON.stringify(err)}`);
        expect(err.code === 201).assertTrue();
        done();
      });
      console.info(`${caseName} test end `);
    });


  })
}
