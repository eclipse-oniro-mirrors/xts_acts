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
import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import uitest from '@ohos.UiTest';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'

export default function ContactInterfaceStageTest() {

  describe('ContactInterfaceStageTest', function () {

    function sleep(numberMillis) {
      var now = new Date();
      var exitTime = now.getTime() + numberMillis;
      while (true) {
        now = new Date();
        if (now.getTime() > exitTime) return;
      }
    }

    beforeAll( async function () {
      console.info("beforeAll case");
      try {
        let driver = await uitest.Driver.create();
        sleep(500);
        for (let i = 0; i < 5; i++) {
          await sleep(500);
          console.info("driver is " + JSON.stringify(driver));
          let button = await driver.findComponent(uitest.ON.text('允许'));
          if (button != undefined) {
            console.info("button is " + JSON.stringify(button));
            await button.click();
          }
        }
        console.info("getPermission end");
      } catch (error) {
        console.info(`getPermission failed, error: ${error}`);
      }
      sleep(3000);
    });

    afterAll(async function () {
      contact.queryContacts(globalThis.context, (err, data) => {
        if (err) {
          console.info("afterAll queryContacts err = " + JSON.stringify(err));
          expect(false).assertTrue();
          return;
        }
        console.info("afterAll queryContacts data = " + JSON.stringify(data));
        if (data.length == 0) {
          return;
        }
        for (var i = 0;i < data.length; i++) {
          let promise = contact.deleteContact(globalThis.context, data[i].key);
          promise.then(() => {
            console.info("afterAll deleteContact success");
          }).catch((err) => {
            console.info("afterAll deleteContact err = " + JSON.stringify(err));
          });
        }
        sleep(3000);
      });
    });

    var contactData = {
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

    var holder = {
      holderId: 1,
      bundleName: "com.ohos.contacts",
      displayName: "phone"
    };
    var attr = {
      attributes: [contact.Attribute.ATTR_CONTACT_EVENT, contact.Attribute.ATTR_EMAIL,
      contact.Attribute.ATTR_GROUP_MEMBERSHIP,
      contact.Attribute.ATTR_IM, contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_NICKNAME,
      contact.Attribute.ATTR_NOTE, contact.Attribute.ATTR_ORGANIZATION, contact.Attribute.ATTR_PHONE,
      contact.Attribute.ATTR_PORTRAIT, contact.Attribute.ATTR_POSTAL_ADDRESS,
      contact.Attribute.ATTR_RELATION,
      contact.Attribute.ATTR_SIP_ADDRESS, contact.Attribute.ATTR_WEBSITE]
    };

    /**
     * @tc.number SUB_Telephony_ContactsApi_query_key_test_0100
     * @tc.name contact:queryKey
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_query_key_test_0100", 0, async function (done) {
      var rawContactId = await contact.addContact(globalThis.context, contactData);
      expect(rawContactId > 0).assertTrue();
      var holder = {
        bundleName: "com.ohos.contacts", displayName: "phone", holderId: 1
      }
      try {
        var resultSet = await contact.queryKey(globalThis.context, rawContactId, holder);
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
    it("SUB_Telephony_ContactsApi_query_key_test_0200", 0, async function (done) {
      var rawContactId = await contact.addContact(globalThis.context, contactData);
      expect(rawContactId > 0).assertTrue();
      console.info("SUB_Telephony_ContactsApi_query_key_test_0200 : query gRawContactId = " + rawContactId);
      try {
        var resultSet = await contact.queryKey(globalThis.context, rawContactId);
        console.info("SUB_Telephony_ContactsApi_query_key_test_0200 : query resultSet = " + JSON.stringify(resultSet));
        expect(JSON.stringify(resultSet) === null).assertFalse();
        done();
      } catch (error) {
        console.info("SUB_Telephony_ContactsApi_query_key_test_0200 query error = " + error);
        done();
      }
      sleep(500);
    });

    /**
     * @tc.number SUB_Telephony_ContactsApi_insert_test_0100
     * @tc.name contact::addContact
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_insert_test_0100", 0, async function (done) {
      var contactDataError = {};
      try {
        var rawContactId = await contact.addContact(globalThis.context, contactDataError);
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
    it("SUB_Telephony_ContactsApi_query_contact_test_0300", 0, async function (done) {
      var queryId = "-1";
      try {
        var resultSet = await contact.queryContact(globalThis.context, queryId);
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
    it("SUB_Telephony_ContactsApi_query_email_test_0400", 0, async function (done) {
      var email = "email2222";
      try {
        var resultSet = await contact.queryContactsByEmail(globalThis.context, email);
        console.info("SUB_Telephony_ContactsApi_query_email_test_0400 : query resultSet = " + JSON.stringify(resultSet));
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
    it("SUB_Telephony_ContactsApi_query_phoneNumber_test_0500", 0, async function (done) {
      var phoneNumber = "19999999";
      try {
        var resultSet = await contact.queryContactsByPhoneNumber(globalThis.context, phoneNumber);
        console.info(
          "SUB_Telephony_ContactsApi_query_phoneNumber_test_0500 : query resultSet = " + JSON.stringify(resultSet));
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
    it("SUB_Telephony_ContactsApi_query_key_test_0600", 0, async function (done) {
      var idTest = -1;
      try {
        var resultSet = await contact.queryKey(globalThis.context, idTest);
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
    it("SUB_Telephony_ContactsApi_addContact_test_0100", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_addContact_test_0100 addContact err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_addContact_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(globalThis.context, data, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_addContact_test_0100 queryKey  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_addContact_test_0100  keyData = " + JSON.stringify(keyData));
          contact.deleteContact(globalThis.context, keyData, (keyData) => {
            if (err) {
              console.info("SUB_Telephony_ContactsApi_addContact_test_0100  err = " + JSON.stringify(err));
              expect(false).assertTrue();
              done();
              return;
            }
            console.log('deleteContact success ' + JSON.stringify(keyData));
            done();
          });
        });
      });
      sleep(500);
    });

    /**
     * @tc.number SUB_Telephony_ContactsApi_addContact_test_0200
     * @tc.name contact::deleteContact
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_addContact_test_0200", 0, async function (done) {
      let promise = contact.addContact(globalThis.context, contactData);
      promise.then((data) => {
        console.info("SUB_Telephony_ContactsApi_addContact_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(globalThis.context, data, (err, keyData) => {
          if (err) {
            console.info("v  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_addContact_test_0200  keyData = " + JSON.stringify(keyData));
          let promise = contact.deleteContact(globalThis.context, keyData);
          promise.then(() => {
            console.log(`deleteContact success`);
            done();
          }).catch((err) => {
            console.info("SUB_Telephony_ContactsApi_addContact_test_0200  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          });
        });
      }).catch((err) => {
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
    it("SUB_Telephony_ContactsApi_queryContact_test_0100", 0, async function (done) {
      var holder = {
        bundleName: "com.ohos.contacts", displayName: "phone", holderId: 1
      }
      expect(holder.bundleName === null).assertFalse();
      expect(holder.displayName === null).assertFalse();
      expect(holder.holderId != 0).assertTrue();
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContact_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(globalThis.context, data, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContact_test_0100  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0100  keyData = " + JSON.stringify(keyData));
          contact.queryContact(globalThis.context, keyData, (err, data) => {
            if (err) {
              console.info("SUB_Telephony_ContactsApi_queryContact_test_0100  err = " + JSON.stringify(err));
              expect(false).assertTrue();
              done();
              return;
            }
            console.info("SUB_Telephony_ContactsApi_queryContact_test_0100  data = " + JSON.stringify(data));
            expect(data.emails[0].email != '').assertTrue();
            done();
          });
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
    it("SUB_Telephony_ContactsApi_queryContact_test_0200", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContact_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(globalThis.context, data, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContact_test_0200  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0200  keyData = " + JSON.stringify(keyData));
          contact.queryContact(globalThis.context, keyData, holder, (err, data) => {
            if (err) {
              console.info("SUB_Telephony_ContactsApi_queryContact_test_0200  err = " + JSON.stringify(err));
              expect(false).assertTrue();
              done();
              return;
            }
            console.info("SUB_Telephony_ContactsApi_queryContact_test_0200  data = " + JSON.stringify(data));
            done();
          });
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
    it("SUB_Telephony_ContactsApi_queryContact_test_0300", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContact_test_0300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(globalThis.context, data, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContact_test_0300  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0300  keyData = " + JSON.stringify(keyData));
          contact.queryContact(globalThis.context, keyData, attr, (err, data) => {
            if (err) {
              console.info("SUB_Telephony_ContactsApi_queryContact_test_0300  err = " + JSON.stringify(err));
              expect(false).assertTrue();
              done();
              return;
            }
            console.info("SUB_Telephony_ContactsApi_queryContact_test_0300  data = " + JSON.stringify(data));
            expect(data.emails[0].email != '').assertTrue();
            done();
          });
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
    it("SUB_Telephony_ContactsApi_queryContact_test_0400", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0400  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContact_test_0400  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(globalThis.context, data, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContact_test_0400  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0400  keyData = " + JSON.stringify(keyData));
          contact.queryContact(globalThis.context, keyData, holder, attr, (err, data) => {
            if (err) {
              console.info("SUB_Telephony_ContactsApi_queryContact_test_0400  err = " + JSON.stringify(err));
              expect(false).assertTrue();
              done();
              return;
            }
            console.info("SUB_Telephony_ContactsApi_queryContact_test_0400  data = " + JSON.stringify(data));
            done();
          });
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
    it("SUB_Telephony_ContactsApi_queryContact_test_0500", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0500  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContact_test_0500  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(globalThis.context, data, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContact_test_0500  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContact_test_0500  keyData = " + JSON.stringify(keyData));
          let promise = contact.queryContact(globalThis.context, keyData, holder, attr);
          promise.then((data) => {
            console.info("SUB_Telephony_ContactsApi_queryContact_test_0500  data = " + JSON.stringify(data));
            done();
          }).catch((err) => {
            console.info("SUB_Telephony_ContactsApi_queryContact_test_0500  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          });
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
    it("SUB_Telephony_ContactsApi_queryContacts_test_0100", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContacts_test_0100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContacts_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContacts(globalThis.context, (err, data) => {
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
    it("SUB_Telephony_ContactsApi_queryContacts_test_0200", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContacts_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContacts_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContacts(globalThis.context, holder, (err, data) => {
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
    it("SUB_Telephony_ContactsApi_queryContacts_test_0300", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContacts_test_0300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContacts_test_0300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContacts(globalThis.context, attr, (err, data) => {
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
    it("SUB_Telephony_ContactsApi_queryContacts_test_0400", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContacts_test_0400  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContacts_test_0400  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContacts(globalThis.context, holder, attr, (err, data) => {
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
    it("SUB_Telephony_ContactsApi_queryContacts_test_0500", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContacts_test_0500  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContacts_test_0500  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.queryContacts(globalThis.context, holder, attr);
        promise.then((data) => {
          console.info("SUB_Telephony_ContactsApi_queryContacts_test_0500  data = " + JSON.stringify(data));
          expect(data.length >= 0).assertTrue();
          done();
        }).catch((err) => {
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
    it("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0100", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByPhoneNumber(globalThis.context, '13800000000', (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0100  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0100  data = " + JSON.stringify(data));
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
    it("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0200", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByPhoneNumber(globalThis.context, '13800000000', holder, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0200  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0200  data = " + JSON.stringify(data));
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
    it("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0300", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByPhoneNumber(globalThis.context, '13800000000', attr, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0300  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0300  data = " + JSON.stringify(data));
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
    it("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0400", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0400  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0400  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByPhoneNumber(globalThis.context, '13800000000', holder, attr, (err, data) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0400  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0400  data = " + JSON.stringify(data));
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
    it("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0500", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0500  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0500  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.queryContactsByPhoneNumber(globalThis.context, '13800000000', holder, attr);
        promise.then((data) => {
          console.info("SUB_Telephony_ContactsApi_queryContactsByPhoneNumber_test_0500  data = " + JSON.stringify(data));
          expect(data.length > 0).assertTrue();
          done();
        }).catch((err) => {
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
    it("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0100", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByEmail(globalThis.context, '13800000000@email.com', (err, data) => {
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
    it("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0200", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByEmail(globalThis.context, '13800000000@email.com', holder, (err, data) => {
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
    it("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0300", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByEmail(globalThis.context, '13800000000@email.com', attr, (err, data) => {
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
    it("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0400", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0400  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0400  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByEmail(globalThis.context, '13800000000@email.com', holder, attr, (err, data) => {
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
    it("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0500", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0500  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0500  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.queryContactsByEmail(globalThis.context, '13800000000@email.com', holder, attr);
        promise.then((data) => {
          console.info("SUB_Telephony_ContactsApi_queryContactsByEmail_test_0500  data = " + JSON.stringify(data));
          expect(data.length > 0).assertTrue();
          done();
        }).catch((err) => {
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
    it("SUB_Telephony_ContactsApi_queryGroups_test_0100", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryGroups_test_0100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryGroups_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryGroups(globalThis.context, (err, data) => {
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
    it("SUB_Telephony_ContactsApi_queryGroups_test_0200", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryGroups_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryGroups_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryGroups(globalThis.context, holder, (err, data) => {
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
    it("SUB_Telephony_ContactsApi_queryGroups_test_0300", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryGroups_test_0300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryGroups_test_0300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.queryGroups(globalThis.context, holder);
        promise.then((data) => {
          console.info("SUB_Telephony_ContactsApi_queryGroups_test_0300  data = " + JSON.stringify(data));
          expect(data.length >= 0).assertTrue();
          done();
        }).catch((err) => {
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
    it("SUB_Telephony_ContactsApi_queryHolders_test_0100", 0, async function (done) {
      contact.queryHolders(globalThis.context, (err, data) => {
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
    it("SUB_Telephony_ContactsApi_queryHolders_test_0200", 0, async function (done) {
      let promise = contact.queryHolders(globalThis.context as Context);
      promise.then((data) => {
        console.info("SUB_Telephony_ContactsApi_queryHolders_test_0200  data = " + JSON.stringify(data));
        expect(data.length >= 0).assertTrue();
        done();
      }).catch((err) => {
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
    it("SUB_Telephony_ContactsApi_queryKey_test_0100", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryKey_test_0100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryKey_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(globalThis.context, data, (err, keyData) => {
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
    it("SUB_Telephony_ContactsApi_queryKey_test_0200", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryKey_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryKey_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(globalThis.context, data, holder, (err, keyData) => {
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
    it("SUB_Telephony_ContactsApi_queryKey_test_0300", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_queryKey_test_0300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_queryKey_test_0300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.queryKey(globalThis.context, data, holder);
        promise.then((keyData) => {
          console.info("SUB_Telephony_ContactsApi_queryKey_test_0300  keyData = " + JSON.stringify(keyData));
          expect(keyData != '').assertTrue();
          done();
        }).catch((err) => {
          console.info("SUB_Telephony_ContactsApi_queryKey_test_0300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });

    /**
     * @tc.number SUB_Telephony_ContactsApi_queryMyCard_test_0100
     * @tc.name contact::queryMyCard
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_queryMyCard_test_0100", 0, async function (done) {
      contact.queryMyCard(globalThis.context, (err, data) => {
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
    it("SUB_Telephony_ContactsApi_queryMyCard_test_0200", 0, async function (done) {
      contact.queryMyCard(globalThis.context, attr, (err, data) => {
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
    it("SUB_Telephony_ContactsApi_queryMyCard_test_0300", 0, async function (done) {
      let promise = contact.queryMyCard(globalThis.context, attr);
      promise.then((data) => {
        console.info("SUB_Telephony_ContactsApi_queryMyCard_test_0300  data = " + JSON.stringify(data));
        done();
      }).catch((err) => {
        console.info("SUB_Telephony_ContactsApi_queryMyCard_test_0300  err = " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
        return;
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
    it("SUB_Telephony_ContactsApi_updateContact_test_0100", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_updateContact_test_0100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_updateContact_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(globalThis.context, data, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_updateContact_test_0100  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_updateContact_test_0100  keyData = " + JSON.stringify(keyData));
          contact.updateContact(globalThis.context, {
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
            contact.queryKey(globalThis.context, data, (err, newKey) => {
              if (err) {
                console.info("SUB_Telephony_ContactsApi_updateContact_test_0100  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
              }
              console.info("SUB_Telephony_ContactsApi_updateContact_test_0100  newKey = " + JSON.stringify(newKey));
              contact.queryContact(globalThis.context, newKey, (err, data) => {
                if (err) {
                  console.info("SUB_Telephony_ContactsApi_updateContact_test_0100  err = " + JSON.stringify(err));
                  expect(false).assertTrue();
                  done();
                  return;
                }
                console.info("SUB_Telephony_ContactsApi_updateContact_test_0100  data = " + JSON.stringify(data));
                expect(data.emails[0].email == "13800000001@email.com").assertTrue();
                done();
              });
            });
          });
        });
      });
      sleep(500);
    });

    /**
     * @tc.number SUB_Telephony_ContactsApi_updateContact_test_0200
     * @tc.name contact::queryKey
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_ContactsApi_updateContact_test_0200", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_updateContact_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_updateContact_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(globalThis.context, data, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_updateContact_test_0200  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_updateContact_test_0200  keyData = " + JSON.stringify(keyData));
          contact.updateContact(globalThis.context, {
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
            contact.queryKey(globalThis.context, data, (err, newKey) => {
              if (err) {
                console.info("SUB_Telephony_ContactsApi_updateContact_test_0200  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
              }
              console.info("SUB_Telephony_ContactsApi_updateContact_test_0200  newKey = " + JSON.stringify(newKey));
              contact.queryContact(globalThis.context, newKey, (err, data) => {
                if (err) {
                  console.info("SUB_Telephony_ContactsApi_updateContact_test_0200  err = " + JSON.stringify(err));
                  expect(false).assertTrue();
                  done();
                  return;
                }
                console.info("SUB_Telephony_ContactsApi_updateContact_test_0200  data = " + JSON.stringify(data));
                expect(data.emails[0].email == "13800000001@email.com").assertTrue();
                done();
              });
            });
          });
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
    it("SUB_Telephony_ContactsApi_updateContact_test_0300", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_updateContact_test_0300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_updateContact_test_0300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(globalThis.context, data, (err, keyData) => {
          if (err) {
            console.info("SUB_Telephony_ContactsApi_updateContact_test_0300  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("SUB_Telephony_ContactsApi_updateContact_test_0300  keyData = " + JSON.stringify(keyData));
          let promise = contact.updateContact(globalThis.context, {
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
            contact.queryKey(globalThis.context, data, (err, newKey) => {
              if (err) {
                console.info("SUB_Telephony_ContactsApi_updateContact_test_0300  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
              }
              console.info("SUB_Telephony_ContactsApi_updateContact_test_0300  newKey = " + JSON.stringify(newKey));
              contact.queryContact(globalThis.context, newKey, (err, data) => {
                if (err) {
                  console.info("SUB_Telephony_ContactsApi_updateContact_test_0300  err = " + JSON.stringify(err));
                  expect(false).assertTrue();
                  done();
                  return;
                }
                console.info("SUB_Telephony_ContactsApi_updateContact_test_0300  data = " + JSON.stringify(data));
                expect(data.emails[0].email == "13800000001@email.com").assertTrue();
                done();
              });
            });
          }).catch((err) => {
            console.info("SUB_Telephony_ContactsApi_updateContact_test_0300  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          });
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
    it("SUB_Telephony_ContactsApi_updateContact_test_0400", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_updateContact_test_0400  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_updateContact_test_0400  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.isLocalContact(globalThis.context, data, (err, data) => {
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
    it("SUB_Telephony_ContactsApi_isLocalContact_test_0200", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_isLocalContact_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_isLocalContact_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.isLocalContact(globalThis.context, data);
        promise.then((data) => {
          console.info("SUB_Telephony_ContactsApi_isLocalContact_test_0200  data = " + JSON.stringify(data));
          done();
        }).catch((err) => {
          console.info("SUB_Telephony_ContactsApi_isLocalContact_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
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
    it("SUB_Telephony_ContactsApi_isMyCard_test_0100", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_isMyCard_test_0100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_isMyCard_test_0100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.isMyCard(globalThis.context, data, (err, data) => {
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
    it("SUB_Telephony_ContactsApi_isMyCard_test_0200", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (err) {
          console.info("SUB_Telephony_ContactsApi_isMyCard_test_0200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("SUB_Telephony_ContactsApi_isMyCard_test_0200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.isMyCard(globalThis.context, data);
        promise.then((data) => {
          console.info("SUB_Telephony_ContactsApi_isMyCard_test_0200  data = " + JSON.stringify(data));
          done();
        }).catch((err) => {
          console.info("SUB_Telephony_ContactsApi_isMyCard_test_0200  err = " + JSON.stringify(err));
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
    it("SUB_Telephony_ContactsApi_selectContacts_test_0100", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
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
    it("SUB_Telephony_ContactsApi_selectContacts_test_0200", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (!err) {
          console.info("SUB_Telephony_ContactsApi_selectContacts_test_0200  data = " + JSON.stringify(data));
          expect(data > 0).assertTrue();
          done();
          return;
        }
        contact.selectContacts().then((data) => {
          console.info("SUB_Telephony_ContactsApi_selectContacts_test_0200  data = " + JSON.stringify(data));
          done();
        }).catch((err) => {
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
    it("SUB_Telephony_ContactsApi_selectContacts_test_0300", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (!err) {
          console.info("SUB_Telephony_ContactsApi_selectContacts_test_0300  data = " + JSON.stringify(data));
          expect(data > 0).assertTrue();
          done();
          return;
        }
        contact.selectContacts({isMultiSelect : false}, (err, data) => {
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
    it("SUB_Telephony_ContactsApi_selectContacts_test_0400", 0, async function (done) {
      contact.addContact(globalThis.context, contactData, (err, data) => {
        if (!err) {
          console.info("SUB_Telephony_ContactsApi_selectContacts_test_0400  data = " + JSON.stringify(data));
          expect(data > 0).assertTrue();
          done();
          return;
        }
        contact.selectContacts({isMultiSelect : false}).then((data) => {
          console.info("SUB_Telephony_ContactsApi_selectContacts_test_0400  data = " + JSON.stringify(data));
          done();
        }).catch((err) => {
          console.info("SUB_Telephony_ContactsApi_selectContacts_test_0400  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });
  });
}
