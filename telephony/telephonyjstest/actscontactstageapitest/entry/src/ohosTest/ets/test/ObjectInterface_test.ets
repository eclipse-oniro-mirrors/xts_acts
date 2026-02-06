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
import { afterAll, afterEach, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import uitest from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

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


export default function ObjectInterfaceTest() {

  describe('ObjectInterfaceTest', () => {
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
    let cdata:contact.Contact = contactData;
    it("contactsApi_queryMyCard_test_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      contact.queryMyCard(context,(err, data) => {
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
    it("contactsApi_queryMyCard_test_200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      contact.queryMyCard(context,attr, (err, data) => {
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
    it("contactsApi_queryMyCard_test_300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      let promise = contact.queryMyCard(context,attr);
      promise.then((data) => {
        console.info("contactsApi_queryMyCard_test_200  data = " + JSON.stringify(data));
        done();
      }).catch((err:BusinessError) => {
        console.info("contactsApi_queryMyCard_test_200  err = " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
        return;
      });
      sleep(500);
    });
    it("contactsApi_isMyCard_test_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      contact.addContact(context,contactData, (err, data) => {
        if (err) {
          console.info("contactsApi_isMyCard_test_100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_isMyCard_test_100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.isMyCard(context,data, (err, data) => {
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
    it("contactsApi_isMyCard_test_200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(1000);
      contact.addContact(context,contactData, (err, data) => {
        if (err) {
          console.info("contactsApi_isMyCard_test_100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_isMyCard_test_100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.isMyCard(context,data);
        promise.then((data) => {
          console.info("contactsApi_isMyCard_test_100  data = " + JSON.stringify(data));
          done();
        }).catch((err:BusinessError) => {
          console.info("contactsApi_isMyCard_test_100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });
    it("contactsApi_contactdata_test_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
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
    it("contactsApi_contactdata_test_200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
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
      expect(attr.attributes != null).assertTrue();
      done();
    });
    it("contactsApi_contactdata_test_300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      if (contactData.emails!=undefined){
        expect(contactData.emails[0].email != null).assertTrue();
        expect(contactData.emails[0].labelName != null).assertTrue();
        expect(contactData.emails[0].labelId != 0).assertTrue();
        expect(contactData.emails[0].displayName != null).assertTrue();
      }
      if (contactData.events!=undefined){
        expect(contactData.events[0].eventDate === null).assertFalse();
        expect(contactData.events[0].labelName === null).assertFalse();
        expect(contactData.events[0].labelId != 0).assertTrue();
      }
      if (contactData.groups!=undefined){
        expect(contactData.groups[0].groupId != 0).assertTrue();
        expect(contactData.groups[0].title === null).assertFalse();
      }
      done();
    });
    it("contactsApi_contactdata_test_400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      if (cdata.imAddresses!=undefined){
        let imAddresses:contact.ImAddress[]=cdata.imAddresses;
        expect(imAddresses[0].imAddress === null).assertFalse();
        expect(imAddresses[0].labelName === null).assertFalse();
        expect(imAddresses[0].labelId != 0).assertTrue();
      }
      if (cdata.name!=undefined){
        let name:contact.Name = cdata.name;
        expect(name.familyName === null).assertFalse();
        expect(name.familyNamePhonetic === null).assertFalse();
        expect(name.fullName === null).assertFalse();
        expect(name.givenName === null).assertFalse();
        expect(name.givenNamePhonetic === null).assertFalse();
        expect(name.middleName === null).assertFalse();
        expect(name.middleNamePhonetic === null).assertFalse();
        expect(name.namePrefix === null).assertFalse();
        expect(name.nameSuffix === null).assertFalse();
      }
      done();
    });
    it("contactsApi_contactdata_test_500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      if (cdata.nickName!=undefined){
        let nickName:contact.NickName=cdata.nickName;
        expect(nickName === null).assertFalse();
      }
      if (cdata.note!=undefined){
        let note:contact.Note=cdata.note;
        expect(note.noteContent === null).assertFalse();
      }
      if (cdata.organization!=undefined){
        let organization:contact.Organization=cdata.organization;
        expect(organization.name === null).assertFalse();
        expect(organization.title === null).assertFalse();
      }
      if (cdata.phoneNumbers!=undefined){
        let phoneNumbers:contact.PhoneNumber[]=cdata.phoneNumbers;
        expect(phoneNumbers[0].labelId != 0).assertTrue();
        expect(phoneNumbers[0].labelName === null).assertFalse();
        expect(phoneNumbers[0].phoneNumber === null).assertFalse();
      }
      if (cdata.portrait!=undefined){
        let portrait:contact.Portrait=cdata.portrait;
        expect(portrait.uri === null).assertFalse();
      }
      done();
    });
    it("contactsApi_contactdata_test_600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      if (cdata.postalAddresses!=undefined){
        let postalAddresses:contact.PostalAddress[]=cdata.postalAddresses;
        console.info("contactData.postalAddresses.city != null"
          + postalAddresses[0].city
          + (postalAddresses[0].city != null));
        expect(postalAddresses[0].city === null).assertFalse();
        expect(postalAddresses[0].country === null).assertFalse();
        expect(postalAddresses[0].labelName === null).assertFalse();
        expect(postalAddresses[0].neighborhood === null).assertFalse();
        expect(postalAddresses[0].pobox === null).assertFalse();
        expect(postalAddresses[0].postalAddress === null).assertFalse();
        expect(postalAddresses[0].postcode === null).assertFalse();
        expect(postalAddresses[0].region === null).assertFalse();
        expect(postalAddresses[0].street === null).assertFalse();
        expect(postalAddresses[0].labelId != 0).assertTrue();
      }
      done();
    });
    it("contactsApi_contactdata_test_700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      if (cdata.relations!=undefined){
        let relations:contact.Relation[]=cdata.relations;
        console.info("contactData.relations.labelName != null"
          + relations[0].labelName + (relations[0].labelName === null));
        expect(relations[0].labelId != 0).assertTrue();
        expect(relations[0].labelName === null).assertFalse();
        expect(relations[0].relationName === null).assertFalse();
      }
      if (cdata.sipAddresses!=undefined){
        let sipAddresses:contact.SipAddress[]=cdata.sipAddresses;
        expect(sipAddresses[0].labelId != 0).assertTrue();
        expect(sipAddresses[0].labelName === null).assertFalse();
        expect(sipAddresses[0].sipAddress === null).assertFalse();
      }
      if (cdata.websites!=undefined){
        let websites:contact.Website[]=cdata.websites;
        expect(websites[0].website === null).assertFalse();
      }
      done();
    });
    it("contactsApi_contactdata_test_800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      if (cdata.contactAttributes!=undefined){
        let contactAttributes:contact.ContactAttributes=cdata.contactAttributes;
        expect(contact.Contact.INVALID_CONTACT_ID == -1).assertTrue();
        expect(contact.Attribute.ATTR_CONTACT_EVENT ==
        contactAttributes.attributes[0]).assertTrue();
        expect(contact.Attribute.ATTR_EMAIL == contactAttributes.attributes[1]).assertTrue();
        expect(contact.Attribute.ATTR_GROUP_MEMBERSHIP ==
        contactAttributes.attributes[2]).assertTrue();
        expect(contact.Attribute.ATTR_IM == contactAttributes.attributes[3]).assertTrue();
        expect(contact.Attribute.ATTR_NAME == contactAttributes.attributes[4]).assertTrue();
        expect(contact.Attribute.ATTR_NICKNAME == contactAttributes.attributes[5]).assertTrue();
        expect(contact.Attribute.ATTR_NOTE == contactAttributes.attributes[6]).assertTrue();
        expect(contact.Attribute.ATTR_ORGANIZATION == contactAttributes.attributes[7]).assertTrue();
        expect(contact.Attribute.ATTR_PHONE == contactAttributes.attributes[8]).assertTrue();
        expect(contact.Attribute.ATTR_PORTRAIT == contactAttributes.attributes[9]).assertTrue();
        expect(contact.Attribute.ATTR_POSTAL_ADDRESS ==
        contactAttributes.attributes[10]).assertTrue();
        expect(contact.Attribute.ATTR_RELATION == contactAttributes.attributes[11]).assertTrue();
        expect(contact.Attribute.ATTR_SIP_ADDRESS == contactAttributes.attributes[12]).assertTrue();
        expect(contact.Attribute.ATTR_WEBSITE == contactAttributes.attributes[13]).assertTrue();
      }

      done();
    });
    it("contactsApi_contactdata_test_900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
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
    it("contactsApi_contactdata_test_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
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
    it("contactsApi_contactdata_test_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
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
    it("contactsApi_query_key_test_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      let rawContactId = await contact.addContact(context,contactData);
      sleep(500);
      expect(rawContactId > 0).assertTrue();
      try {
        let resultSet = await contact.queryKey(context,rawContactId, holder);
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
    it("contactsApi_query_key_test_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      let rawContactId = await contact.addContact(context,contactData);
      sleep(500);
      expect(rawContactId > 0).assertTrue();
      console.info("contactsApi_query_key_test_2400 : query gRawContactId = " + rawContactId);
      try {
        let resultSet = await contact.queryKey(context,rawContactId);
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
    it("abnormal_contactsApi_insert_test_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      let contactDataError:contact.Contact = {};
      try {
        sleep(500);
        let rawContactId = await contact.addContact(context,contactDataError);
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
    it("abnormal_contactsApi_query_contact_test_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      let queryId = "-1";
      try {
        let resultSet = await contact.queryContact(context,queryId);
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
    it("abnormal_contactsApi_query_email_test_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      let email = "email2222";
      try {
        let resultSet = await contact.queryContactsByEmail(context,email);
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
    it("abnormal_contactsApi_query_phoneNumber_test_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      let phoneNumber = "19999999";
      try {
        let resultSet = await contact.queryContactsByPhoneNumber(context,phoneNumber);
        console.info("abnormal_contactsApi_query_phoneNumber_test_3400 : query resultSet = " +
        JSON.stringify(resultSet));
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
    it("abnormal_contactsApi_query_key_test_3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      let idtest = -1;
      try {
        let resultSet = await contact.queryKey(context,idtest);
        console.info("abnormal_contactsApi_query_key_test_3600 : query resultSet = " + JSON.stringify(resultSet));
        expect(resultSet.length == 0).assertTrue();
        done();
      } catch (error) {
        console.info("abnormal_contactsApi_query_key_test_3600 query error = " + error);
        done();
      }
      sleep(500);
    });
    it("contactsApi_addContact_test_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_addContact_test_100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_addContact_test_100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context,data, (err, keyData) => {
          if (err) {
            console.info("contactsApi_addContact_test_100  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("contactsApi_addContact_test_100  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined){
            sleep(500);
            contact.deleteContact(context,keyData, (keyData) => {
              if (err) {
                console.info("contactsApi_addContact_test_100  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
              }
              console.log('deleteContact success');
              done();
            });
          }else {done()}
        });
      });
      sleep(500);
    });
    it("contactsApi_addContact_test_200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      let promise = contact.addContact(context,contactData);
      promise.then((data) => {
        sleep(500);
        console.info("contactsApi_addContact_test_200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context,data, (err, keyData) => {
          if (err) {
            console.info("contactsApi_addContact_test_200  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("contactsApi_addContact_test_200  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined) {
            sleep(500);
            let promise = contact.deleteContact(context,keyData);
            promise.then(() => {
              console.log(`deleteContact success`);
              done();
            }).catch((err:BusinessError) => {
              console.info("contactsApi_addContact_test_200  err = " + JSON.stringify(err));
              expect(false).assertTrue();
              done();
              return;
            });
          }else {done()}
        });
      }).catch((err:BusinessError) => {
        console.info("contactsApi_addContact_test_200  err = " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
        return;
      });
      sleep(500);
    });
    it("contactsApi_queryContact_test_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      let holder:contact.Holder = {
        bundleName: "com.ohos.contacts", displayName: "phone", holderId: 1
      };
      expect(holder.bundleName === null).assertFalse();
      expect(holder.displayName === null).assertFalse();
      expect(holder.holderId != 0).assertTrue();
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContact_test_100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContact_test_100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context,data, (err, keyData) => {
          if (err) {
            console.info("contactsApi_queryContact_test_100  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("contactsApi_queryContact_test_100  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined){
            contact.queryContact(context,keyData, (err, data) => {
              if (err) {
                console.info("contactsApi_queryContact_test_100  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
              }
              console.info("contactsApi_queryContact_test_100  data = " + JSON.stringify(data));
              let resDate: contact.Contact = data;
              if (resDate.emails !== undefined) {
                let emails: contact.Email[] = resDate.emails;
                if (emails[0].email !== undefined) {
                  let email: string = emails[0].email;
                  expect(email != "").assertTrue();
                  done();
                };
              };
            });
          }else {done()}
        });
      });
      sleep(500);
    });
    it("contactsApi_queryContact_test_200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContact_test_200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContact_test_200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context,data, (err, keyData) => {
          if (err) {
            console.info("contactsApi_queryContact_test_200  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("contactsApi_queryContact_test_200  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined){
            contact.queryContact(context,keyData, holder, (err, data) => {
              if (err) {
                console.info("contactsApi_queryContact_test_200  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
              }
              console.info("contactsApi_queryContact_test_200  data = " + JSON.stringify(data));
              done();
            });
          }else {done()}
        });
      });
      sleep(500);
    });
    it("contactsApi_queryContact_test_300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContact_test_300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContact_test_300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context,data, (err, keyData) => {
          if (err) {
            console.info("contactsApi_queryContact_test_300  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("contactsApi_queryContact_test_300  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined){
            contact.queryContact(context,keyData, attr, (err, data) => {
              if (err) {
                console.info("contactsApi_queryContact_test_300  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
              }
              console.info("contactsApi_queryContact_test_300  data = " + JSON.stringify(data));
              let resDate: contact.Contact = data;
              if (resDate.emails !== undefined) {
                let emails: contact.Email[] = resDate.emails;
                if (emails[0].email !== undefined) {
                  let email: string = emails[0].email;
                  expect(email != "").assertTrue();
                  done();
                };
              };
            });
          }else {done()}
        });
      });
      sleep(500);
    });
    it("contactsApi_queryContact_test_400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContact_test_400  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContact_test_400  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context,data, (err, keyData) => {
          if (err) {
            console.info("contactsApi_queryContact_test_400  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("contactsApi_queryContact_test_400  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined){
            contact.queryContact(context,keyData, holder, attr, (err, data) => {
              if (err) {
                console.info("contactsApi_queryContact_test_400  err = " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
                return;
              }
              console.info("contactsApi_queryContact_test_400  data = " + JSON.stringify(data));
              done();
            });
          }else {done()}
        });
      });
      sleep(500);
    });
    it("contactsApi_queryContact_test_500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContact_test_500  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContact_test_500  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context,data, (err, keyData) => {
          if (err) {
            console.info("contactsApi_queryContact_test_500  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("contactsApi_queryContact_test_500  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined) {
            let promise = contact.queryContact(context,keyData, holder, attr);
            promise.then((data) => {
              console.info("contactsApi_queryContact_test_500  data = " + JSON.stringify(data));
              done();
            }).catch((err:BusinessError) => {
              console.info("contactsApi_queryContact_test_500  err = " + JSON.stringify(err));
              expect(false).assertTrue();
              done();
              return;
            });
          }else {done()}
        });
      });
      sleep(500);
    });
    it("contactsApi_queryContacts_test_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContacts_test_100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContacts_test_100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContacts(context,(err, data) => {
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
    it("contactsApi_queryContacts_test_200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContacts_test_200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContacts_test_200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContacts(context,holder, (err, data) => {
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
    it("contactsApi_queryContacts_test_300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContacts_test_300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContacts_test_300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContacts(context,attr, (err, data) => {
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
    it("contactsApi_queryContacts_test_400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContacts_test_400  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContacts_test_400  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContacts(context,holder, attr, (err, data) => {
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
    it("contactsApi_queryContacts_test_500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContacts_test_500  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContacts_test_500  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.queryContacts(context,holder, attr);
        promise.then((data) => {
          console.info("contactsApi_queryContacts_test_500  data = " + JSON.stringify(data));
          expect(data.length >= 0).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.info("contactsApi_queryContacts_test_500  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });
    it("contactsApi_queryContactsByPhoneNumber_test_000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContactsByPhoneNumber_test_000  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContactsByPhoneNumber_test_000  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByPhoneNumber(context,'13800000000', (err, data) => {
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
    it("contactsApi_queryContactsByPhoneNumber_test_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContactsByPhoneNumber_test_100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContactsByPhoneNumber_test_100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByPhoneNumber(context,'13800000000', holder, (err, data) => {
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
    it("contactsApi_queryContactsByPhoneNumber_test_200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContactsByPhoneNumber_test_200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContactsByPhoneNumber_test_200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByPhoneNumber(context,'13800000000', attr, (err, data) => {
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
    it("contactsApi_queryContactsByPhoneNumber_test_300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContactsByPhoneNumber_test_300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContactsByPhoneNumber_test_300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByPhoneNumber(context,'13800000000', holder, attr, (err, data) => {
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
    it("contactsApi_queryContactsByPhoneNumber_test_400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContactsByPhoneNumber_test_400  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContactsByPhoneNumber_test_400  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.queryContactsByPhoneNumber(context,'13800000000', holder, attr);
        promise.then((data) => {
          console.info("contactsApi_queryContactsByPhoneNumber_test_400  data = " + JSON.stringify(data));
          expect(data.length > 0).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.info("contactsApi_queryContactsByPhoneNumber_test_400  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });
    it("contactsApi_queryContactsByEmail_test_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContactsByEmail_test_100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContactsByEmail_test_100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByEmail(context,'13800000000@email.com', (err, data) => {
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
    it("contactsApi_queryContactsByEmail_test_200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContactsByEmail_test_200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContactsByEmail_test_200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByEmail(context,'13800000000@email.com', holder, (err, data) => {
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
    it("contactsApi_queryContactsByEmail_test_300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContactsByEmail_test_300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContactsByEmail_test_300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByEmail(context,'13800000000@email.com', attr, (err, data) => {
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
    it("contactsApi_queryContactsByEmail_test_400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContactsByEmail_test_400  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContactsByEmail_test_400  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryContactsByEmail(context,'13800000000@email.com', holder, attr, (err, data) => {
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
    it("contactsApi_queryContactsByEmail_test_500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryContactsByEmail_test_500  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryContactsByEmail_test_500  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.queryContactsByEmail(context,'13800000000@email.com', holder, attr);
        promise.then((data) => {
          console.info("contactsApi_queryContactsByEmail_test_500  data = " + JSON.stringify(data));
          expect(data.length > 0).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.info("contactsApi_queryContactsByEmail_test_500  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });
    it("contactsApi_queryGroups_test_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryGroups_test_100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryGroups_test_100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryGroups(context,(err, data) => {
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
    it("contactsApi_queryGroups_test_200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryGroups_test_200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryGroups_test_200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryGroups(context,holder, (err, data) => {
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
    it("contactsApi_queryGroups_test_300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryGroups_test_300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryGroups_test_300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.queryGroups(context,holder);
        promise.then((data) => {
          console.info("contactsApi_queryGroups_test_300  data = " + JSON.stringify(data));
          expect(data.length >= 0).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.info("contactsApi_queryGroups_test_300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });
    it("contactsApi_queryHolders_test_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      contact.queryHolders(context,(err, data) => {
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
    it("contactsApi_queryHolders_test_200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      let promise = contact.queryHolders(context);
      promise.then((data) => {
        console.info("contactsApi_queryHolders_test_200  data = " + JSON.stringify(data));
        expect(data.length >= 0).assertTrue();
        done();
      }).catch((err:BusinessError) => {
        console.info("contactsApi_queryHolders_test_200  err = " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
        return;
      });
      sleep(500);
    });
    it("contactsApi_queryKey_test_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryKey_test_100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryKey_test_100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context,data, (err, keyData) => {
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
    it("contactsApi_queryKey_test_200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryKey_test_200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryKey_test_200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context,data, holder, (err, keyData) => {
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
    it("contactsApi_queryKey_test_300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      sleep(500);
      let context: Context = AppStorage.get('context') as Context;
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_queryKey_test_300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_queryKey_test_300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.queryKey(context,data, holder);
        promise.then((keyData) => {
          console.info("contactsApi_queryKey_test_300  keyData = " + JSON.stringify(keyData));
          expect(keyData != '').assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.info("contactsApi_queryKey_test_300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });

    it("contactsApi_updateContact_test_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_updateContact_test_100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_updateContact_test_100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context,data, (err, keyData) => {
          if (err) {
            console.info("contactsApi_updateContact_test_100  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("contactsApi_updateContact_test_100  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined){
            contact.updateContact(context,{
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
              contact.queryKey(context,data, (err, newKey) => {
                if (err) {
                  console.info("contactsApi_updateContact_test_100  err = " + JSON.stringify(err));
                  expect(false).assertTrue();
                  done();
                  return;
                }
                console.info("contactsApi_updateContact_test_100  newKey = " + JSON.stringify(newKey));
                contact.queryContact(context,newKey, (err, data) => {
                  if (err) {
                    console.info("contactsApi_updateContact_test_100  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                  }
                  console.info("contactsApi_updateContact_test_100  data = " + JSON.stringify(data));
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
    it("contactsApi_updateContact_test_200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_updateContact_test_200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_updateContact_test_200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context,data, (err, keyData) => {
          if (err) {
            console.info("contactsApi_updateContact_test_200  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("contactsApi_updateContact_test_200  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined){
            contact.updateContact(context,{
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
              contact.queryKey(context,data, (err, newKey) => {
                if (err) {
                  console.info("contactsApi_updateContact_test_200  err = " + JSON.stringify(err));
                  expect(false).assertTrue();
                  done();
                  return;
                }
                console.info("contactsApi_updateContact_test_200  newKey = " + JSON.stringify(newKey));
                contact.queryContact(context,newKey, (err, data) => {
                  if (err) {
                    console.info("contactsApi_updateContact_test_200  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                  }
                  console.info("contactsApi_updateContact_test_200  data = " + JSON.stringify(data));
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
    it("contactsApi_updateContact_test_300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_updateContact_test_300  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_updateContact_test_300  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.queryKey(context,data, (err, keyData) => {
          if (err) {
            console.info("contactsApi_updateContact_test_300  err = " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
            return;
          }
          console.info("contactsApi_updateContact_test_300  keyData = " + JSON.stringify(keyData));
          if (JSON.stringify(keyData) != undefined) {
            let promise = contact.updateContact(context,{
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
              contact.queryKey(context,data, (err, newKey) => {
                if (err) {
                  console.info("contactsApi_updateContact_test_300  err = " + JSON.stringify(err));
                  expect(false).assertTrue();
                  done();
                  return;
                }
                console.info("contactsApi_updateContact_test_300  newKey = " + JSON.stringify(newKey));
                contact.queryContact(context,newKey, (err, data) => {
                  if (err) {
                    console.info("contactsApi_updateContact_test_300  err = " + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                    return;
                  }
                  console.info("contactsApi_updateContact_test_300  data = " + JSON.stringify(data));
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
              console.info("contactsApi_updateContact_test_300  err = " + JSON.stringify(err));
              expect(false).assertTrue();
              done();
              return;
            });
          }else {done()}
        });
      });
      sleep(500);
    });
    it("contactsApi_isLocalContact_test_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_isLocalContact_test_100  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_isLocalContact_test_100  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        contact.isLocalContact(context,data, (err, data) => {
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
    it("contactsApi_isLocalContact_test_200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
        if (err) {
          console.info("contactsApi_isLocalContact_test_200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        }
        console.info("contactsApi_isLocalContact_test_200  data = " + JSON.stringify(data));
        expect(data > 0).assertTrue();
        let promise = contact.isLocalContact(context,data);
        promise.then((data) => {
          console.info("contactsApi_isLocalContact_test_200  data = " + JSON.stringify(data));
          done();
        }).catch((err:BusinessError) => {
          console.info("contactsApi_isLocalContact_test_200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
          return;
        });
      });
      sleep(500);
    });

    it("contactsApi_sendMessage_test_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      let sendCallback = (err:BusinessError, data:sms.ISendShortMessageCallback) => {
        console.info("contactsApi_sendMessage_test_100  err = " + JSON.stringify(err));
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      };
      let deliveryCallback = (err:BusinessError, data:sms.IDeliveryShortMessageCallback) => {
        console.info("contactsApi_sendMessage_test_100  err = " + JSON.stringify(err));
        expect(JSON.stringify(data) === null).assertFalse();
        done();
      };
      let slotId = 0;
      let content = '短信内容';
      let destinationHost = '+861xxxxxxxxxx';
      let serviceCenter = '+861xxxxxxxxxx';
      let destinationPort = 1000;
      let options:sms.SendMessageOptions = {
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
    it("contactsApi_selectContact_test_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
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
    it("contactsApi_selectContact_test_200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let context: Context = AppStorage.get('context') as Context;
      sleep(500);
      contact.addContact(context,contactData, (err, data) => {
        sleep(500);
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
        }).catch((err:BusinessError) => {
          console.info("contactsApi_selectContact_test_200  err = " + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        });
      });
    });
  });
}