/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import sms from '@ohos.telephony.sms';
import featureAbility from '@ohos.ability.featureAbility';
import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import uitest from '@ohos.UiTest';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'

export default function ObjectInterfaceTest() {

    describe('ObjectInterfaceTest', function () {

        function sleep(numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)return;
            }
        }

        beforeAll( async function () {
        console.info("beforeAll case");
        try {
            let permissions = ["ohos.permission.WRITE_CONTACTS", "ohos.permission.READ_CONTACTS"];
            let atManager = abilityAccessCtrl.createAtManager();
            atManager.requestPermissionsFromUser(globalThis.context, permissions, (err, result) => {
            if (err) {
                console.info('getPermission failed: ' + JSON.stringify(err));
            } else {
                console.info('getPermission suc: ' + JSON.stringify(result));
            }
            });

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
            contact.queryContacts((err, data) => {
                if (err) {
                    console.info("contactsApi_selectContact_test_100  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    return;
                }
                console.info("contactsApi_selectContact_test_100  data = " + JSON.stringify(data));
                if (data.length == 0) {
                    return;
                }
                for (var i = 0;i < data.length; i++) {
                    let promise = contact.deleteContact(data[i].key);
                    promise.then(() => {
                        console.info("deleteContact success");
                    }).catch((err) => {
                        console.info("contactsApi_selectContact_test_100  err = " + JSON.stringify(err));
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

        it("contactsApi_contactdata_test_100", 0, async function (done) {
            console.info("contactData.id" + contactData.id);
            console.info("contactData.id" + (contactData.id == 0));
            expect(contactData.id == 0).assertTrue();
            console.info("contactData.key" + contactData.key);
            console.info("contactData.key" + (contactData.key == "0"));
            expect(contactData.key).assertEqual("0");
            console.info("contactData.contactAttributes" + contactData.contactAttributes);
            console.info("contactData.contactAttributes" + (contactData.contactAttributes != null));
            expect(contactData.contactAttributes != null).assertTrue();
            console.info("contactData.emails" + contactData.emails);
            expect(contactData.emails != null).assertTrue();
            expect(contactData.events != null).assertTrue();
            expect(contactData.groups != null).assertTrue();
            expect(contactData.imAddresses != null).assertTrue();
            done();
        });

        it("contactsApi_contactdata_test_200", 0, async function (done) {
            expect(contactData.phoneNumbers != null).assertTrue();
            expect(contactData.portrait != null).assertTrue();
            expect(contactData.postalAddresses != null).assertTrue();
            expect(contactData.relations != null).assertTrue();
            expect(contactData.sipAddresses != null).assertTrue();
            expect(contactData.websites != null).assertTrue();
            expect(contactData.name != null).assertTrue();
            expect(contactData.nickName != null).assertTrue();
            expect(contactData.note != null).assertTrue();
            expect(contactData.organization != null).assertTrue();
            expect(contactData.contactAttributes.attributes != null).assertTrue();
            done();
        });

        it("contactsApi_contactdata_test_300", 0, async function (done) {
            expect(contactData.emails[0].email === null).assertFalse();
            expect(contactData.emails[0].labelName === null).assertFalse();
            console.info("contactData.emails.labelId == 1" + contactData.emails[0].labelId);
            expect(contactData.emails[0].labelId != 0).assertTrue();
            expect(contactData.emails[0].displayName === null).assertFalse();
            expect(contactData.events[0].eventDate === null).assertFalse();
            expect(contactData.events[0].labelName === null).assertFalse();
            expect(contactData.events[0].labelId != 0).assertTrue();
            expect(contactData.groups[0].groupId != 0).assertTrue();
            expect(contactData.groups[0].title === null).assertFalse();
            done();
        });
        it("contactsApi_contactdata_test_400", 0, async function (done) {
            expect(contactData.imAddresses[0].imAddress === null).assertFalse();
            expect(contactData.imAddresses[0].labelName === null).assertFalse();
            expect(contactData.imAddresses[0].labelId != 0).assertTrue();
            expect(contactData.name.familyName === null).assertFalse();
            expect(contactData.name.familyNamePhonetic === null).assertFalse();
            expect(contactData.name.fullName === null).assertFalse();
            expect(contactData.name.givenName === null).assertFalse();
            expect(contactData.name.givenNamePhonetic === null).assertFalse();
            expect(contactData.name.middleName === null).assertFalse();
            expect(contactData.name.middleNamePhonetic === null).assertFalse();
            expect(contactData.name.namePrefix === null).assertFalse();
            expect(contactData.name.nameSuffix === null).assertFalse();
            done();
        });

        it("contactsApi_contactdata_test_500", 0, async function (done) {
            expect(contactData.nickName.nickName === null).assertFalse();
            expect(contactData.note.noteContent === null).assertFalse();
            expect(contactData.organization.name === null).assertFalse();
            expect(contactData.organization.title === null).assertFalse();
            expect(contactData.phoneNumbers[0].labelId != 0).assertTrue();
            expect(contactData.phoneNumbers[0].labelName === null).assertFalse();
            expect(contactData.phoneNumbers[0].phoneNumber === null).assertFalse();
            expect(contactData.portrait.uri === null).assertFalse();
            done();
        });

        it("contactsApi_contactdata_test_600", 0, async function (done) {
            console.info("contactData.postalAddresses.city != null"
            + contactData.postalAddresses[0].city
            + (contactData.postalAddresses[0].city != null));
            expect(contactData.postalAddresses[0].city === null).assertFalse();
            expect(contactData.postalAddresses[0].country === null).assertFalse();
            expect(contactData.postalAddresses[0].labelName === null).assertFalse();
            expect(contactData.postalAddresses[0].neighborhood === null).assertFalse();
            expect(contactData.postalAddresses[0].pobox === null).assertFalse();
            expect(contactData.postalAddresses[0].postalAddress === null).assertFalse();
            expect(contactData.postalAddresses[0].postcode === null).assertFalse();
            expect(contactData.postalAddresses[0].region === null).assertFalse();
            expect(contactData.postalAddresses[0].street === null).assertFalse();
            expect(contactData.postalAddresses[0].labelId != 0).assertTrue();
            done();
        });

        it("contactsApi_contactdata_test_700", 0, async function (done) {
            console.info("contactData.relations.labelName != null"
            + contactData.relations[0].labelName + (contactData.relations[0].labelName === null));
            expect(contactData.relations[0].labelId != 0).assertTrue();
            expect(contactData.relations[0].labelName === null).assertFalse();
            expect(contactData.relations[0].relationName === null).assertFalse();
            expect(contactData.sipAddresses[0].labelId != 0).assertTrue();
            expect(contactData.sipAddresses[0].labelName === null).assertFalse();
            expect(contactData.sipAddresses[0].sipAddress === null).assertFalse();
            expect(contactData.websites[0].website === null).assertFalse();
            done();
        });


        it("contactsApi_contactdata_test_800", 0, async function (done) {
            expect(contact.Contact.INVALID_CONTACT_ID == -1).assertTrue();
            expect(contact.Attribute.ATTR_CONTACT_EVENT ==
            contactData.contactAttributes.attributes[0]).assertTrue();
            expect(contact.Attribute.ATTR_EMAIL == contactData.contactAttributes.attributes[1]).assertTrue();
            expect(contact.Attribute.ATTR_GROUP_MEMBERSHIP ==
            contactData.contactAttributes.attributes[2]).assertTrue();
            expect(contact.Attribute.ATTR_IM == contactData.contactAttributes.attributes[3]).assertTrue();
            expect(contact.Attribute.ATTR_NAME == contactData.contactAttributes.attributes[4]).assertTrue();
            expect(contact.Attribute.ATTR_NICKNAME == contactData.contactAttributes.attributes[5]).assertTrue();
            expect(contact.Attribute.ATTR_NOTE == contactData.contactAttributes.attributes[6]).assertTrue();
            expect(contact.Attribute.ATTR_ORGANIZATION == contactData.contactAttributes.attributes[7]).assertTrue();
            expect(contact.Attribute.ATTR_PHONE == contactData.contactAttributes.attributes[8]).assertTrue();
            expect(contact.Attribute.ATTR_PORTRAIT == contactData.contactAttributes.attributes[9]).assertTrue();
            expect(contact.Attribute.ATTR_POSTAL_ADDRESS ==
            contactData.contactAttributes.attributes[10]).assertTrue();
            expect(contact.Attribute.ATTR_RELATION == contactData.contactAttributes.attributes[11]).assertTrue();
            expect(contact.Attribute.ATTR_SIP_ADDRESS == contactData.contactAttributes.attributes[12]).assertTrue();
            expect(contact.Attribute.ATTR_WEBSITE == contactData.contactAttributes.attributes[13]).assertTrue();
            done();
        });

        it("contactsApi_contactdata_test_900", 0, async function (done) {
            expect(contact.Email.CUSTOM_LABEL == 0).assertTrue();
            expect(contact.Email.EMAIL_HOME == 1).assertTrue();
            expect(contact.Email.EMAIL_WORK == 2).assertTrue();
            expect(contact.Email.EMAIL_OTHER == 3).assertTrue();
            expect(contact.Email.INVALID_LABEL_ID == -1).assertTrue();
            expect(contact.Event.CUSTOM_LABEL == 0).assertTrue();
            expect(contact.Event.EVENT_ANNIVERSARY == 1).assertTrue();
            expect(contact.Event.EVENT_OTHER == 2).assertTrue();
            expect(contact.Event.EVENT_BIRTHDAY == 3).assertTrue();
            expect(contact.Email.INVALID_LABEL_ID == -1).assertTrue();
            expect(contact.ImAddress.CUSTOM_LABEL == -1).assertTrue();
            expect(contact.ImAddress.IM_AIM == 0).assertTrue();
            expect(contact.ImAddress.IM_MSN == 1).assertTrue();
            expect(contact.ImAddress.IM_YAHOO == 2).assertTrue();
            expect(contact.ImAddress.IM_SKYPE == 3).assertTrue();
            expect(contact.ImAddress.IM_QQ == 4).assertTrue();
            expect(contact.ImAddress.IM_ICQ == 6).assertTrue();
            expect(contact.ImAddress.IM_JABBER == 7).assertTrue();
            expect(contact.ImAddress.INVALID_LABEL_ID == -2).assertTrue();
            done();
        });

        it("contactsApi_contactdata_test_1000", 0, async function (done) {
            expect(contact.PhoneNumber.CUSTOM_LABEL == 0).assertTrue();
            expect(contact.PhoneNumber.NUM_HOME == 1).assertTrue();
            expect(contact.PhoneNumber.NUM_MOBILE == 2).assertTrue();
            expect(contact.PhoneNumber.NUM_WORK == 3).assertTrue();
            expect(contact.PhoneNumber.NUM_FAX_WORK == 4).assertTrue();
            expect(contact.PhoneNumber.NUM_FAX_HOME == 5).assertTrue();
            expect(contact.PhoneNumber.NUM_PAGER == 6).assertTrue();
            expect(contact.PhoneNumber.NUM_OTHER == 7).assertTrue();
            expect(contact.PhoneNumber.NUM_CALLBACK == 8).assertTrue();
            expect(contact.PhoneNumber.NUM_CAR == 9).assertTrue();
            expect(contact.PhoneNumber.NUM_COMPANY_MAIN == 10).assertTrue();
            expect(contact.PhoneNumber.NUM_ISDN == 11).assertTrue();
            expect(contact.PhoneNumber.NUM_MAIN == 12).assertTrue();
            expect(contact.PhoneNumber.NUM_OTHER_FAX == 13).assertTrue();
            expect(contact.PhoneNumber.NUM_RADIO == 14).assertTrue();
            expect(contact.PhoneNumber.NUM_TELEX == 15).assertTrue();
            expect(contact.PhoneNumber.NUM_TTY_TDD == 16).assertTrue();
            expect(contact.PhoneNumber.NUM_WORK_MOBILE == 17).assertTrue();
            expect(contact.PhoneNumber.NUM_WORK_PAGER == 18).assertTrue();
            expect(contact.PhoneNumber.NUM_ASSISTANT == 19).assertTrue();
            expect(contact.PhoneNumber.NUM_MMS == 20).assertTrue();
            expect(contact.PhoneNumber.INVALID_LABEL_ID == -1).assertTrue();
            expect(contact.PostalAddress.CUSTOM_LABEL == 0).assertTrue();
            expect(contact.PostalAddress.ADDR_HOME == 1).assertTrue();
            expect(contact.PostalAddress.ADDR_WORK == 2).assertTrue();
            expect(contact.PostalAddress.ADDR_OTHER == 3).assertTrue();
            expect(contact.PostalAddress.INVALID_LABEL_ID == -1).assertTrue();
            done();
        });

        it("contactsApi_contactdata_test_1100", 0, async function (done) {
            expect(contact.Relation.CUSTOM_LABEL == 0).assertTrue();
            expect(contact.Relation.RELATION_ASSISTANT == 1).assertTrue();
            expect(contact.Relation.RELATION_BROTHER == 2).assertTrue();
            expect(contact.Relation.RELATION_CHILD == 3).assertTrue();
            expect(contact.Relation.RELATION_DOMESTIC_PARTNER == 4).assertTrue();
            expect(contact.Relation.RELATION_FATHER == 5).assertTrue();
            expect(contact.Relation.RELATION_FRIEND == 6).assertTrue();
            expect(contact.Relation.RELATION_MANAGER == 7).assertTrue();
            expect(contact.Relation.RELATION_MOTHER == 8).assertTrue();
            expect(contact.Relation.RELATION_PARENT == 9).assertTrue();
            expect(contact.Relation.RELATION_PARTNER == 10).assertTrue();
            expect(contact.Relation.RELATION_REFERRED_BY == 11).assertTrue();
            expect(contact.Relation.RELATION_RELATIVE == 12).assertTrue();
            expect(contact.Relation.RELATION_SISTER == 13).assertTrue();
            expect(contact.Relation.RELATION_SPOUSE == 14).assertTrue();
            expect(contact.Relation.INVALID_LABEL_ID == -1).assertTrue();
            expect(contact.SipAddress.CUSTOM_LABEL == 0).assertTrue();
            expect(contact.SipAddress.SIP_HOME == 1).assertTrue();
            expect(contact.SipAddress.SIP_WORK == 2).assertTrue();
            expect(contact.SipAddress.SIP_OTHER == 3).assertTrue();
            expect(contact.SipAddress.INVALID_LABEL_ID == -1).assertTrue();
            done();
        });

        /**
         * @tc.number contactsApi_query_key_test_2300
         * @tc.name Query key information
         * @tc.desc Function test
         */
        it("contactsApi_query_key_test_2300", 0, async function (done) {
            var rawContactId = await contact.addContact(contactData);
            expect(rawContactId > 0).assertTrue();
            var holder = {
                bundleName: "com.ohos.contacts", displayName: "phone", holderId: 1
            }
            try {
                var resultSet = await contact.queryKey(rawContactId, holder);
                console.info("contactsApi_query_key_test_2300 : query resultSet = " + JSON.stringify(resultSet));
                expect(JSON.stringify(resultSet) === null).assertFalse();
                done();
            } catch (error) {
                console.info("contactsApi_query_key_test_2300 query error = " + error);
                done();
            }
            sleep(500);
        });

        /**
         * @tc.number contactsApi_query_key_test_2400
         * @tc.name Query key information
         * @tc.desc Function test
         */
        it("contactsApi_query_key_test_2400", 0, async function (done) {
            var rawContactId = await contact.addContact(contactData);
            expect(rawContactId > 0).assertTrue();
            console.info("contactsApi_query_key_test_2400 : query gRawContactId = " + rawContactId);
            try {
                var resultSet = await contact.queryKey(rawContactId);
                console.info("contactsApi_query_key_test_2400 : query resultSet = " + JSON.stringify(resultSet));
                expect(JSON.stringify(resultSet) === null).assertFalse();
                done();
            } catch (error) {
                console.info("contactsApi_query_key_test_2400 query error = " + error);
                done();
            }
            sleep(500);
        });

        /**
         * @tc.number abnormal_contactsApi_insert_test_2800
         * @tc.name contactsApi_insert error
         * @tc.desc Function test
         */
        it("abnormal_contactsApi_insert_test_2800", 0, async function (done) {
            var contactDataError = {};
            try {
                var rawContactId = await contact.addContact(contactDataError);
                console.info("abnormal_contactsApi_insert_test_2800 : rawContactId = " + rawContactId);
                expect(rawContactId == -1).assertTrue();
                done();
            } catch (error) {
                console.info("contactsApi_insert_test_100 : raw_contact insert error = " + error);
                done();
            }
            sleep(500);
        });

        /**
         * @tc.number abnormal_contactsApi_query_contact_test_3100
         * @tc.name contactsApi_query_contact error
         * @tc.desc Function test
         */
        it("abnormal_contactsApi_query_contact_test_3100", 0, async function (done) {
            var queryId = "-1";
            try {
                var resultSet = await contact.queryContact(queryId);
                if (resultSet == null) {
                    console.info("abnormal_contactsApi_query_contact_test_3100 is null");
                }
                if (resultSet == undefined) {
                    console.info("abnormal_contactsApi_query_contact_test_3100 is undefined");
                }
                console.info("abnormal_contactsApi_query_contact_test_3100 : updateCode = " + JSON.stringify(resultSet));
                expect(resultSet == undefined).assertTrue();
                done();
            } catch (error) {
                console.info("abnormal_contactsApi_query_contact_test_3100 query error = " + error);
                done();
            }
            sleep(500);
        });

        /**
         * @tc.number abnormal_contactsApi_query_email_test_3300
         * @tc.name contactsApi_query_email error
         * @tc.desc Function test
         */
        it("abnormal_contactsApi_query_email_test_3300", 0, async function (done) {
            var email = "email2222";
            try {
                var resultSet = await contact.queryContactsByEmail(email);
                console.info("abnormal_contactsApi_query_email_test_3300 : query resultSet = " + JSON.stringify(resultSet));
                expect(resultSet.length == 0).assertTrue();
                done();
            } catch (error) {
                console.info("abnormal_contactsApi_query_email_test_3300 query error = " + error);
                done();
            }
            sleep(500);
        });

        /**
         * @tc.number abnormal_contactsApi_query_phoneNumber_test_3400
         * @tc.name contactsApi_query_phoneNumber error
         * @tc.desc Function test
         */
        it("abnormal_contactsApi_query_phoneNumber_test_3400", 0, async function (done) {
            var phoneNumber = "19999999";
            try {
                var resultSet = await contact.queryContactsByPhoneNumber(phoneNumber);
                console.info(
                    "abnormal_contactsApi_query_phoneNumber_test_3400 : query resultSet = " + JSON.stringify(resultSet));
                expect(resultSet.length == 0).assertTrue();
                done();
            } catch (error) {
                console.info("abnormal_contactsApi_query_phoneNumber_test_3400 query error = " + error);
                done();
            }
            sleep(500);
        });

        /**
         * @tc.number abnormal_contactsApi_query_key_test_3600
         * @tc.name contactsApi_query_key error
         * @tc.desc Function test
         */
        it("abnormal_contactsApi_query_key_test_3600", 0, async function (done) {
            var idtest = -1;
            try {
                var resultSet = await contact.queryKey(idtest);
                console.info("abnormal_contactsApi_query_key_test_3600 : query resultSet = " + JSON.stringify(resultSet));
                expect(resultSet.length == 0).assertTrue();
                done();
            } catch (error) {
                console.info("abnormal_contactsApi_query_key_test_3600 query error = " + error);
                done();
            }
            sleep(500);
        });

        it("contactsApi_addContact_test_100", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_addContact_test_100  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_addContact_test_100  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryKey(data, (err, keyData) => {
                    if (err) {
                        console.info("contactsApi_addContact_test_100  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_addContact_test_100  keyData = " + JSON.stringify(keyData));
                    contact.deleteContact(keyData, (keyData) => {
                        if (err) {
                            console.info("contactsApi_addContact_test_100  err = " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        console.log('deleteContact success');
                        done();
                    });
                });
            });
            sleep(500);
        });

        it("contactsApi_addContact_test_200", 0, async function (done) {
            let promise = contact.addContact(contactData);
            promise.then((data) => {
                console.info("contactsApi_addContact_test_200  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryKey(data, (err, keyData) => {
                    if (err) {
                        console.info("contactsApi_addContact_test_200  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_addContact_test_200  keyData = " + JSON.stringify(keyData));
                    let promise = contact.deleteContact(keyData);
                    promise.then(() => {
                        console.log(`deleteContact success`);
                        done();
                    }).catch((err) => {
                        console.info("contactsApi_addContact_test_200  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    });
                });
            }).catch((err) => {
                console.info("contactsApi_addContact_test_200  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
            });
            sleep(500);
        });

        it("contactsApi_queryContact_test_100", 0, async function (done) {
            var holder = {
                bundleName: "com.ohos.contacts", displayName: "phone", holderId: 1
            }
            expect(holder.bundleName === null).assertFalse();
            expect(holder.displayName === null).assertFalse();
            expect(holder.holderId != 0).assertTrue();
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContact_test_100  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContact_test_100  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryKey(data, (err, keyData) => {
                    if (err) {
                        console.info("contactsApi_queryContact_test_100  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryContact_test_100  keyData = " + JSON.stringify(keyData));
                    contact.queryContact(keyData, (err, data) => {
                        if (err) {
                            console.info("contactsApi_queryContact_test_100  err = " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        console.info("contactsApi_queryContact_test_100  data = " + JSON.stringify(data));
                        expect(data.emails[0].email != '').assertTrue();
                        done();
                    });
                });
            });
            sleep(500);
        });

        it("contactsApi_queryContact_test_200", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContact_test_200  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContact_test_200  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryKey(data, (err, keyData) => {
                    if (err) {
                        console.info("contactsApi_queryContact_test_200  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryContact_test_200  keyData = " + JSON.stringify(keyData));
                    contact.queryContact(keyData, holder, (err, data) => {
                        if (err) {
                            console.info("contactsApi_queryContact_test_200  err = " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        console.info("contactsApi_queryContact_test_200  data = " + JSON.stringify(data));
                        done();
                    });
                });
            });
            sleep(500);
        });

        it("contactsApi_queryContact_test_300", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContact_test_300  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContact_test_300  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryKey(data, (err, keyData) => {
                    if (err) {
                        console.info("contactsApi_queryContact_test_300  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryContact_test_300  keyData = " + JSON.stringify(keyData));
                    contact.queryContact(keyData, attr, (err, data) => {
                        if (err) {
                            console.info("contactsApi_queryContact_test_300  err = " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        console.info("contactsApi_queryContact_test_300  data = " + JSON.stringify(data));
                        expect(data.emails[0].email != '').assertTrue();
                        done();
                    });
                });
            });
            sleep(500);
        });

        it("contactsApi_queryContact_test_400", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContact_test_400  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContact_test_400  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryKey(data, (err, keyData) => {
                    if (err) {
                        console.info("contactsApi_queryContact_test_400  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryContact_test_400  keyData = " + JSON.stringify(keyData));
                    contact.queryContact(keyData, holder, attr, (err, data) => {
                        if (err) {
                            console.info("contactsApi_queryContact_test_400  err = " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        console.info("contactsApi_queryContact_test_400  data = " + JSON.stringify(data));
                        done();
                    });
                });
            });
            sleep(500);
        });

        it("contactsApi_queryContact_test_500", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContact_test_500  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContact_test_500  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryKey(data, (err, keyData) => {
                    if (err) {
                        console.info("contactsApi_queryContact_test_500  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryContact_test_500  keyData = " + JSON.stringify(keyData));
                    let promise = contact.queryContact(keyData, holder, attr);
                    promise.then((data) => {
                        console.info("contactsApi_queryContact_test_500  data = " + JSON.stringify(data));
                        done();
                    }).catch((err) => {
                        console.info("contactsApi_queryContact_test_500  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    });
                });
            });
            sleep(500);
        });

        it("contactsApi_queryContacts_test_100", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContacts_test_100  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContacts_test_100  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryContacts((err, data) => {
                    if (err) {
                        console.info("contactsApi_queryContacts_test_100  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryContacts_test_100  data = " + JSON.stringify(data));
                    expect(data.length > 0).assertTrue();
                    done();
                });
            });
            sleep(500);
        });

        it("contactsApi_queryContacts_test_200", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContacts_test_200  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContacts_test_200  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryContacts(holder, (err, data) => {
                    if (err) {
                        console.info("contactsApi_queryContacts_test_200  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryContacts_test_200  data = " + JSON.stringify(data));
                    expect(data.length >= 0).assertTrue();
                    done();
                });
            });
            sleep(500);
        });

        it("contactsApi_queryContacts_test_300", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContacts_test_300  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContacts_test_300  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryContacts(attr, (err, data) => {
                    if (err) {
                        console.info("contactsApi_queryContacts_test_300  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryContacts_test_300  data = " + JSON.stringify(data));
                    expect(data.length > 0).assertTrue();
                    done();
                });
            });
            sleep(500);
        });


        it("contactsApi_queryContacts_test_400", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContacts_test_400  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContacts_test_400  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryContacts(holder, attr, (err, data) => {
                    if (err) {
                        console.info("contactsApi_queryContacts_test_400  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryContacts_test_400  data = " + JSON.stringify(data));
                    expect(data.length >= 0).assertTrue();
                    done();
                });
            });
            sleep(500);
        });


        it("contactsApi_queryContacts_test_500", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContacts_test_500  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContacts_test_500  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                let promise = contact.queryContacts(holder, attr);
                promise.then((data) => {
                    console.info("contactsApi_queryContacts_test_500  data = " + JSON.stringify(data));
                    expect(data.length >= 0).assertTrue();
                    done();
                }).catch((err) => {
                    console.info("contactsApi_queryContacts_test_500  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                });
            });
            sleep(500);
        });

        it("contactsApi_queryContactsByPhoneNumber_test_000", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContactsByPhoneNumber_test_000  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContactsByPhoneNumber_test_000  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryContactsByPhoneNumber('13800000000', (err, data) => {
                    if (err) {
                        console.info("contactsApi_queryContactsByPhoneNumber_test_000  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryContactsByPhoneNumber_test_000  data = " + JSON.stringify(data));
                    expect(data.length > 0).assertTrue();
                    done();
                });
            });
            sleep(500);
        });

        it("contactsApi_queryContactsByPhoneNumber_test_100", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContactsByPhoneNumber_test_100  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContactsByPhoneNumber_test_100  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryContactsByPhoneNumber('13800000000', holder, (err, data) => {
                    if (err) {
                        console.info("contactsApi_queryContactsByPhoneNumber_test_100  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryContactsByPhoneNumber_test_100  data = " + JSON.stringify(data));
                    expect(data.length > 0).assertTrue();
                    done();
                });
            });
            sleep(500);
        });

        it("contactsApi_queryContactsByPhoneNumber_test_200", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContactsByPhoneNumber_test_200  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContactsByPhoneNumber_test_200  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryContactsByPhoneNumber('13800000000', attr, (err, data) => {
                    if (err) {
                        console.info("contactsApi_queryContactsByPhoneNumber_test_200  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryContactsByPhoneNumber_test_200  data = " + JSON.stringify(data));
                    expect(data.length > 0).assertTrue();
                    done();
                });
            });
            sleep(500);
        });

        it("contactsApi_queryContactsByPhoneNumber_test_300", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContactsByPhoneNumber_test_300  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContactsByPhoneNumber_test_300  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryContactsByPhoneNumber('13800000000', holder, attr, (err, data) => {
                    if (err) {
                        console.info("contactsApi_queryContactsByPhoneNumber_test_300  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryContactsByPhoneNumber_test_300  data = " + JSON.stringify(data));
                    expect(data.length > 0).assertTrue();
                    done();
                });
            });
            sleep(500);
        });

        it("contactsApi_queryContactsByPhoneNumber_test_400", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContactsByPhoneNumber_test_400  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContactsByPhoneNumber_test_400  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                let promise = contact.queryContactsByPhoneNumber('13800000000', holder, attr);
                promise.then((data) => {
                    console.info("contactsApi_queryContactsByPhoneNumber_test_400  data = " + JSON.stringify(data));
                    expect(data.length > 0).assertTrue();
                    done();
                }).catch((err) => {
                    console.info("contactsApi_queryContactsByPhoneNumber_test_400  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                });
            });
            sleep(500);
        });

        it("contactsApi_queryContactsByEmail_test_100", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContactsByEmail_test_100  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContactsByEmail_test_100  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryContactsByEmail('13800000000@email.com', (err, data) => {
                    if (err) {
                        console.info("contactsApi_queryContactsByEmail_test_100  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryContactsByEmail_test_100  data = " + JSON.stringify(data));
                    expect(data.length > 0).assertTrue();
                    done();
                });
            });
            sleep(500);
        });

        it("contactsApi_queryContactsByEmail_test_200", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContactsByEmail_test_200  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContactsByEmail_test_200  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryContactsByEmail('13800000000@email.com', holder, (err, data) => {
                    if (err) {
                        console.info("contactsApi_queryContactsByEmail_test_200  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryContactsByEmail_test_200  data = " + JSON.stringify(data));
                    expect(data.length > 0).assertTrue();
                    done();
                });
            });
            sleep(500);
        });


        it("contactsApi_queryContactsByEmail_test_300", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContactsByEmail_test_300  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContactsByEmail_test_300  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryContactsByEmail('13800000000@email.com', attr, (err, data) => {
                    if (err) {
                        console.info("contactsApi_queryContactsByEmail_test_300  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryContactsByEmail_test_300  data = " + JSON.stringify(data));
                    expect(data.length > 0).assertTrue();
                    done();
                });
            });
            sleep(500);
        });


        it("contactsApi_queryContactsByEmail_test_400", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContactsByEmail_test_400  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContactsByEmail_test_400  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryContactsByEmail('13800000000@email.com', holder, attr, (err, data) => {
                    if (err) {
                        console.info("contactsApi_queryContactsByEmail_test_400  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryContactsByEmail_test_400  data = " + JSON.stringify(data));
                    expect(data.length > 0).assertTrue();
                    done();
                });
            });
            sleep(500);
        });

        it("contactsApi_queryContactsByEmail_test_500", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryContactsByEmail_test_500  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryContactsByEmail_test_500  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                let promise = contact.queryContactsByEmail('13800000000@email.com', holder, attr);
                promise.then((data) => {
                    console.info("contactsApi_queryContactsByEmail_test_500  data = " + JSON.stringify(data));
                    expect(data.length > 0).assertTrue();
                    done();
                }).catch((err) => {
                    console.info("contactsApi_queryContactsByEmail_test_500  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                });
            });
            sleep(500);
        });

        it("contactsApi_queryGroups_test_100", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryGroups_test_100  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryGroups_test_100  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryGroups((err, data) => {
                    if (err) {
                        console.info("contactsApi_queryGroups_test_100  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryGroups_test_100  data = " + JSON.stringify(data));
                    expect(data.length >= 0).assertTrue();
                    done();
                });
            });
            sleep(500);
        });

        it("contactsApi_queryGroups_test_200", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryGroups_test_200  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryGroups_test_200  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryGroups(holder, (err, data) => {
                    if (err) {
                        console.info("contactsApi_queryGroups_test_200  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryGroups_test_200  data = " + JSON.stringify(data));
                    expect(data.length >= 0).assertTrue();
                    done();
                });
            });
            sleep(500);
        });

        it("contactsApi_queryGroups_test_300", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryGroups_test_300  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryGroups_test_300  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                let promise = contact.queryGroups(holder);
                promise.then((data) => {
                    console.info("contactsApi_queryGroups_test_300  data = " + JSON.stringify(data));
                    expect(data.length >= 0).assertTrue();
                    done();
                }).catch((err) => {
                    console.info("contactsApi_queryGroups_test_300  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                });
            });
            sleep(500);
        });

        it("contactsApi_queryHolders_test_100", 0, async function (done) {
            contact.queryHolders((err, data) => {
                if (err) {
                    console.info("contactsApi_queryHolders_test_100  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryHolders_test_100  data = " + JSON.stringify(data));
                expect(data.length >= 0).assertTrue();
                done();
            });
            sleep(500);
        });

        it("contactsApi_queryHolders_test_200", 0, async function (done) {
            let promise = contact.queryHolders();
            promise.then((data) => {
                console.info("contactsApi_queryHolders_test_200  data = " + JSON.stringify(data));
                expect(data.length >= 0).assertTrue();
                done();
            }).catch((err) => {
                console.info("contactsApi_queryHolders_test_200  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
            });
            sleep(500);
        });

        it("contactsApi_queryKey_test_100", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryKey_test_100  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryKey_test_100  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryKey(data, (err, keyData) => {
                    if (err) {
                        console.info("contactsApi_queryKey_test_100  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryKey_test_100  keyData = " + JSON.stringify(keyData));
                    expect(keyData != '').assertTrue();
                    done();
                });
            });
            sleep(500);
        });

        it("contactsApi_queryKey_test_200", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryKey_test_200  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryKey_test_200  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryKey(data, holder, (err, keyData) => {
                    if (err) {
                        console.info("contactsApi_queryKey_test_200  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_queryKey_test_200  keyData = " + JSON.stringify(keyData));
                    expect(keyData != '').assertTrue();
                    done();
                });
            });
            sleep(500);
        });
        it("contactsApi_queryKey_test_300", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryKey_test_300  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryKey_test_300  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                let promise = contact.queryKey(data, holder);
                promise.then((keyData) => {
                    console.info("contactsApi_queryKey_test_300  keyData = " + JSON.stringify(keyData));
                    expect(keyData != '').assertTrue();
                    done();
                }).catch((err) => {
                    console.info("contactsApi_queryKey_test_300  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                });
            });
            sleep(500);
        });


        it("contactsApi_queryMyCard_test_100", 0, async function (done) {
            contact.queryMyCard((err, data) => {
                if (err) {
                    console.info("contactsApi_queryMyCard_test_100  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryMyCard_test_100  data = " + JSON.stringify(data));
                done();
            });
            sleep(500);
        });


        it("contactsApi_queryMyCard_test_200", 0, async function (done) {
            contact.queryMyCard(attr, (err, data) => {
                if (err) {
                    console.info("contactsApi_queryMyCard_test_200  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_queryMyCard_test_200  data = " + JSON.stringify(data));
                done();
            });
            sleep(500);
        });

        it("contactsApi_queryMyCard_test_300", 0, async function (done) {
            let promise = contact.queryMyCard(attr);
            promise.then((data) => {
                console.info("contactsApi_queryMyCard_test_200  data = " + JSON.stringify(data));
                done();
            }).catch((err) => {
                console.info("contactsApi_queryMyCard_test_200  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
            });
            sleep(500);
        });

        it("contactsApi_updateContact_test_100", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_updateContact_test_100  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_updateContact_test_100  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryKey(data, (err, keyData) => {
                    if (err) {
                        console.info("contactsApi_updateContact_test_100  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_updateContact_test_100  keyData = " + JSON.stringify(keyData));
                    contact.updateContact({
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
                            console.info("contactsApi_updateContact_test_100  err = " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        console.log('updateContact success');
                        contact.queryKey(data, (err, newKey) => {
                            if (err) {
                                console.info("contactsApi_updateContact_test_100  err = " + JSON.stringify(err));
                                expect(false).assertTrue();
                                done();
                                return;
                            }
                            console.info("contactsApi_updateContact_test_100  newKey = " + JSON.stringify(newKey));
                            contact.queryContact(newKey, (err, data) => {
                                if (err) {
                                    console.info("contactsApi_updateContact_test_100  err = " + JSON.stringify(err));
                                    expect(false).assertTrue();
                                    done();
                                    return;
                                }
                                console.info("contactsApi_updateContact_test_100  data = " + JSON.stringify(data));
                                expect(data.emails[0].email == "13800000001@email.com").assertTrue();
                                done();
                            });
                        });
                    });
                });
            });
            sleep(500);
        });

        it("contactsApi_updateContact_test_200", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_updateContact_test_200  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_updateContact_test_200  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryKey(data, (err, keyData) => {
                    if (err) {
                        console.info("contactsApi_updateContact_test_200  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_updateContact_test_200  keyData = " + JSON.stringify(keyData));
                    contact.updateContact({
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
                            console.info("contactsApi_updateContact_test_200  err = " + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        console.log('updateContact success');
                        contact.queryKey(data, (err, newKey) => {
                            if (err) {
                                console.info("contactsApi_updateContact_test_200  err = " + JSON.stringify(err));
                                expect(false).assertTrue();
                                done();
                                return;
                            }
                            console.info("contactsApi_updateContact_test_200  newKey = " + JSON.stringify(newKey));
                            contact.queryContact(newKey, (err, data) => {
                                if (err) {
                                    console.info("contactsApi_updateContact_test_200  err = " + JSON.stringify(err));
                                    expect(false).assertTrue();
                                    done();
                                    return;
                                }
                                console.info("contactsApi_updateContact_test_200  data = " + JSON.stringify(data));
                                expect(data.emails[0].email == "13800000001@email.com").assertTrue();
                                done();
                            });
                        });
                    });
                });
            });
            sleep(500);
        });

        it("contactsApi_updateContact_test_300", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_updateContact_test_300  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_updateContact_test_300  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.queryKey(data, (err, keyData) => {
                    if (err) {
                        console.info("contactsApi_updateContact_test_300  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_updateContact_test_300  keyData = " + JSON.stringify(keyData));
                    let promise = contact.updateContact({
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
                        contact.queryKey(data, (err, newKey) => {
                            if (err) {
                                console.info("contactsApi_updateContact_test_300  err = " + JSON.stringify(err));
                                expect(false).assertTrue();
                                done();
                                return;
                            }
                            console.info("contactsApi_updateContact_test_300  newKey = " + JSON.stringify(newKey));
                            contact.queryContact(newKey, (err, data) => {
                                if (err) {
                                    console.info("contactsApi_updateContact_test_300  err = " + JSON.stringify(err));
                                    expect(false).assertTrue();
                                    done();
                                    return;
                                }
                                console.info("contactsApi_updateContact_test_300  data = " + JSON.stringify(data));
                                expect(data.emails[0].email == "13800000001@email.com").assertTrue();
                                done();
                            });
                        });
                    }).catch((err) => {
                        console.info("contactsApi_updateContact_test_300  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    });
                });
            });
            sleep(500);
        });

        it("contactsApi_isLocalContact_test_100", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_isLocalContact_test_100  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_isLocalContact_test_100  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.isLocalContact(data, (err, data) => {
                    if (err) {
                        console.info("contactsApi_isLocalContact_test_100  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_isLocalContact_test_100  data = " + JSON.stringify(data));
                    done();
                });
            });
            sleep(500);
        });

        it("contactsApi_isLocalContact_test_200", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_isLocalContact_test_200  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_isLocalContact_test_200  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                let promise = contact.isLocalContact(data);
                promise.then((data) => {
                    console.info("contactsApi_isLocalContact_test_200  data = " + JSON.stringify(data));
                    done();
                }).catch((err) => {
                    console.info("contactsApi_isLocalContact_test_200  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                });
            });
            sleep(500);
        });

        it("contactsApi_isMyCard_test_100", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_isMyCard_test_100  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_isMyCard_test_100  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                contact.isMyCard(data, (err, data) => {
                    if (err) {
                        console.info("contactsApi_isMyCard_test_100  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_isMyCard_test_100  data = " + JSON.stringify(data));
                    done();
                });
            });
            sleep(500);
        });


        it("contactsApi_isMyCard_test_200", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (err) {
                    console.info("contactsApi_isMyCard_test_100  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info("contactsApi_isMyCard_test_100  data = " + JSON.stringify(data));
                expect(data > 0).assertTrue();
                let promise = contact.isMyCard(data);
                promise.then((data) => {
                    console.info("contactsApi_isMyCard_test_100  data = " + JSON.stringify(data));
                    done();
                }).catch((err) => {
                    console.info("contactsApi_isMyCard_test_100  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                });
            });
            sleep(500);
        });


        it("contactsApi_sendMessage_test_100", 0, async function (done) {
            let sendCallback = function (err, data) {
                console.info("contactsApi_sendMessage_test_100  err = " + JSON.stringify(err));
                expect(JSON.stringify(data) === null).assertFalse();
                done();
            }
            let deliveryCallback = function (err, data) {
                console.info("contactsApi_sendMessage_test_100  err = " + JSON.stringify(err));
                expect(JSON.stringify(data) === null).assertFalse();
                done();
            }
            let slotId = 0;
            let content = '短信内容';
            let destinationHost = '+861xxxxxxxxxx';
            let serviceCenter = '+861xxxxxxxxxx';
            let destinationPort = 1000;
            let options = {
                slotId,
                content,
                destinationHost,
                serviceCenter,
                destinationPort,
                sendCallback,
                deliveryCallback
            };
            sms.sendMessage(options);
            done();
            sleep(500);
        });

        it("contactsApi_selectContact_test_100", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (!err) {
                    console.info("contactsApi_selectContact_test_100  data = " + JSON.stringify(data));
                    expect(data > 0).assertTrue();
                    done();
                    return;
                }
                contact.selectContact((err, data) => {
                    if (err) {
                        console.info("contactsApi_selectContact_test_100  err = " + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info("contactsApi_selectContact_test_100  data = " + JSON.stringify(data));
                    done();
                });
            });
        });

        it("contactsApi_selectContact_test_200", 0, async function (done) {
            contact.addContact(contactData, (err, data) => {
                if (!err) {
                    console.info("contactsApi_selectContact_test_200  data = " + JSON.stringify(data));
                    expect(data > 0).assertTrue();
                    done();
                    return;
                }
                let promise = contact.selectContact();
                promise.then((data) => {
                    console.info("contactsApi_selectContact_test_200  data = " + JSON.stringify(data));
                    done();
                }).catch((err) => {
                    console.info("contactsApi_selectContact_test_200  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                });
            });
        });
    });
}