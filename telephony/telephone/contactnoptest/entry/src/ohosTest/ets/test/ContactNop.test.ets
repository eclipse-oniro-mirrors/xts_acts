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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';

const PERMISSION_DENIED_CODE = 201
const PARAMETER_ERROR_CODE = 401
const SERVICE_EXCEPTION_CODE = 14500101
const SERVICE_EXCEPTION_MSG = 'Service exception.'
const PARAMETER_ERROR_MSG = 'The parameter invalid.'
const SENSOR_NO_SUPPORT_CODE = 14500102
const PERMISSION_DENIED_MSG = 'Permission denied.'

export default function contact_NopTest() {
  describe('contact_NopTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop001
     * @tc.name       : contact_addContact_nop001
     * @tc.desc       : Using the addContact (callback) method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_addContact_nop001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_addContact_nop001----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(
          context,
          {
            name: {
              fullName: 'xxx'
            },
            phoneNumbers: [{
              phoneNumber: '138xxxxxxxx'
            }]
          }, (err: BusinessError, data) => {
          console.error(`contact_addContact_nop001 callback: success data->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("contact_addContact_nop001 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_addContact_nop001----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop002
     * @tc.name       : contact_addContact_nop002
     * @tc.desc       : Using the addContact (then) method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_addContact_nop002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_addContact_nop002----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.addContact(
          context,
          {
            name: {
              fullName: 'xxx'
            },
            phoneNumbers: [{
              phoneNumber: '138xxxxxxxx'
            }]
          }).then((data) => {
          console.log(`contact_addContact_nop002 success: data->${JSON.stringify(data)}`);
          try{
            expect().assertFail();
          }catch(err){
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`contact_addContact_nop002 fail: err->${JSON.stringify(err)}`);

          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();

        });
      } catch (err) {
        console.error("contact_addContact_nop002 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_addContact_nop002----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop003
     * @tc.name       : contact_deleteContact_nop003
     * @tc.desc       : Using the deleteContact (callback) method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_deleteContact_nop003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_deleteContact_nop003----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.deleteContact(context, 'xxx', (err: BusinessError) => {
          console.error(`contact_deleteContact_nop003 fail: err->${JSON.stringify(err)}`);

          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();

        });
      } catch (err) {
        console.error("contact_deleteContact_nop003 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_deleteContact_nop003----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop004
     * @tc.name       : contact_deleteContact_nop004
     * @tc.desc       : Using the deleteContact (then) method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_deleteContact_nop004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_deleteContact_nop004----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.deleteContact(context, 'xxx').then(() => {
          console.log(`deleteContact success`);
          try{
            expect().assertFail();
          }catch(err){
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`contact_deleteContact_nop004 fail: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("contact_deleteContact_nop004 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_deleteContact_nop004----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop005
     * @tc.name       : contact_updateContact_nop005
     * @tc.desc       : Using the updateContact (callback) method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_updateContact_nop005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_updateContact_nop005----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.updateContact(context, {
          id: 1,
          name: {
            fullName: 'xxx'
          },
          phoneNumbers: [{
            phoneNumber: '138xxxxxxxx'
          }]
        }).then(() => {
          console.log(`contact_updateContact_nop005 success`);
          try{
            expect().assertFail();
          }catch(err){
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`contact_updateContact_nop005 fail: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("contact_deleteContact_nop004 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_deleteContact_nop004----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop006
     * @tc.name       : contact_updateContact_nop006
     * @tc.desc       : Using the updateContact (then) method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_updateContact_nop006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_updateContact_nop006----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.updateContact(context, {
          id: 1,
          name: {
            fullName: 'xxx'
          },
          phoneNumbers: [{
            phoneNumber: '138xxxxxxxx'
          }]
        }).then(() => {
          console.log(`contact_updateContact_nop006 success`);
          try{
            expect().assertFail();
          }catch(err){
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`contact_updateContact_nop006 fail: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("contact_updateContact_nop006 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_updateContact_nop006----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop007
     * @tc.name       : contact_queryContactsByPhoneNumber_nop007
     * @tc.desc       : Using the queryContactsByPhoneNumber (context、number、attrs) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryContactsByPhoneNumber_nop007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryContactsByPhoneNumber_nop007----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByPhoneNumber(context, '138xxxxxxxx', {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        }, (err: BusinessError, data) => {
          console.error(`contact_updateContact_nop006 fail: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("contact_queryContactsByPhoneNumber_nop007 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryContactsByPhoneNumber_nop007----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop008
     * @tc.name       : contact_queryContactsByPhoneNumber_nop008
     * @tc.desc       : Using the queryContactsByPhoneNumber (context、number) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryContactsByPhoneNumber_nop008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryContactsByPhoneNumber_nop008----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByPhoneNumber(context, '138xxxxxxxx', (err: BusinessError, data) => {
          console.error(`contact_queryContactsByPhoneNumber_nop008 fail: data->${JSON.stringify(data)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("contact_queryContactsByPhoneNumber_nop008 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryContactsByPhoneNumber_nop008----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop009
     * @tc.name       : contact_isLocalContact_nop009
     * @tc.desc       : Using the contact_isLocalContact_nop009 (context、id) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_isLocalContact_nop009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_isLocalContact_nop009----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.isLocalContact(context, /*id*/1, (err: BusinessError, data) => {
          if (err) {
            console.log(`contact_isLocalContact_nop009 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`isLocalContact callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_isLocalContact_nop009 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_isLocalContact_nop009----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop010
     * @tc.name       : contact_queryContactsByEmail_nop010
     * @tc.desc       : Using the contact_queryContactsByEmail_nop010 (context、Email) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryContactsByEmail_nop010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryContactsByEmail_nop010----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, 'xxx@email.com', (err: BusinessError, data) => {
          if (err) {
            console.log(`contact_queryContactsByEmail_nop010 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`contact_queryContactsByEmail_nop010 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_queryContactsByEmail_nop010 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryContactsByEmail_nop010----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop011
     * @tc.name       : contact_queryMyCard_nop011
     * @tc.desc       : Using the contact_queryMyCard_nop011 (context、attrs) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryMyCard_nop011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryMyCard_nop011----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, 'xxx@email.com', (err: BusinessError, data) => {
          if (err) {
            console.log(`contact_queryMyCard_nop011 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`contact_queryMyCard_nop011 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_queryMyCard_nop011 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryMyCard_nop011----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop012
     * @tc.name       : contact_queryMyCard_nop012
     * @tc.desc       : Using the contact_queryMyCard_nop012 (context) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryMyCard_nop012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryMyCard_nop012----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryMyCard(context, (err: BusinessError, data) => {
          if (err) {
            console.log(`queryMyCard callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`queryMyCard callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_queryMyCard_nop012 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryMyCard_nop012----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop013
     * @tc.name       : contact_queryContacts_nop013
     * @tc.desc       : Using the contact_queryContacts_nop013 (context) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryContacts_nop013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryContacts_nop013----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContacts(context, (err: BusinessError, data) => {
          if (err) {
            console.log(`contact_queryContacts_nop013 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`contact_queryContacts_nop013 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_queryContacts_nop013 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryContacts_nop013----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop014
     * @tc.name       : contact_queryContacts_nop014
     * @tc.desc       : Using the contact_queryContacts_nop014 (context,attrs) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryContacts_nop014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryContacts_nop014----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContacts(context, {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        }, (err: BusinessError, data) => {
          if (err) {
            console.log(`contact_queryContacts_nop014 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`contact_queryContacts_nop014 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_queryContacts_nop014 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryContacts_nop021----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop015
     * @tc.name       : contact_queryContact_nop015
     * @tc.desc       : Using the contact_queryContact_nop015 (context,key,attrs) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryContact_nop015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryContact_nop015----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContact(context, 'xxx', {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        }, (err: BusinessError, data) => {
          if (err) {
            console.log(`contact_queryContact_nop015 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`contact_queryContact_nop015 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_queryContact_nop015 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryContact_nop015----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop016
     * @tc.name       : contact_queryContact_nop016
     * @tc.desc       : Using the contact_queryContact_nop016 (context,key) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryContact_nop016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryContact_nop016----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContact(context, 'xxx', (err: BusinessError, data) => {
          if (err) {
            console.log(`contact_queryContact_nop016 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`contact_queryContact_nop016 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_queryContact_nop016 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryContact_nop016----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop017
     * @tc.name       : contact_queryKey_nop017
     * @tc.desc       : Using the contact_queryKey_nop017 (context,id) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryKey_nop017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryKey_nop017----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryKey(context, /*id*/1, (err: BusinessError, data) => {
          if (err) {
            console.log(`contact_queryKey_nop017 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`contact_queryKey_nop017 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_queryKey_nop017 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryKey_nop017----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop018
     * @tc.name       : contact_queryGroups_nop018
     * @tc.desc       : Using the contact_queryGroups_nop031 (context) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryGroups_nop018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryGroups_nop018----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryGroups(context, (err: BusinessError, data) => {
          if (err) {
            console.log(`contact_queryGroups_nop018 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`contact_queryGroups_nop018 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_queryGroups_nop018 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryGroups_nop018----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop019
     * @tc.name       : contact_isMyCard_nop019
     * @tc.desc       : Using the contact_isMyCard_nop019 (context,id) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_isMyCard_nop019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_isMyCard_nop019----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.isMyCard(context, /*id*/1, (err: BusinessError, data) => {
          if (err) {
            console.log(`contact_isMyCard_nop019 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`contact_isMyCard_nop019 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_isMyCard_nop019 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_isMyCard_nop019----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop020
     * @tc.name       : contact_queryHolders_nop020
     * @tc.desc       : Using the contact_queryHolders_nop020 (context) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryHolders_nop020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryHolders_nop020----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryHolders(context, (err: BusinessError, data) => {
          if (err) {
            console.log(`queryHolders callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`queryHolders callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_queryHolders_nop020 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryHolders_nop020----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop021
     * @tc.name       : contact_queryContactsByPhoneNumber_nop021
     * @tc.desc       : Using the queryContactsByPhoneNumber (context、number、holder、attrs) then method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryContactsByPhoneNumber_nop021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryContactsByPhoneNumber_nop021----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByPhoneNumber(context, '138xxxxxxxx', {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        }).then((data) => {
          console.log(`contact_queryContactsByPhoneNumber_nop021 success: data->${JSON.stringify(data)}`);
          try{
            expect().assertFail();
          }catch(err){
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`contact_queryContactsByPhoneNumber_nop021 fail: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("contact_queryContactsByPhoneNumber_nop021 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryContactsByPhoneNumber_nop021----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop022
     * @tc.name       : contact_queryContactsByPhoneNumber_nop022
     * @tc.desc       : Using the queryContactsByPhoneNumber (context、number、holder) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryContactsByPhoneNumber_nop022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryContactsByPhoneNumber_nop022----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByPhoneNumber(context, '138xxxxxxxx', {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, (err: BusinessError, data) => {
          console.error(`contact_queryContactsByPhoneNumber_nop022 callback: fail: err->${JSON.stringify(err)}`);
          try{
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          }catch(err){
            console.error(`contact_queryContactsByPhoneNumber_nop022 callback: fail: err->${JSON.stringify(err)}`);
          }
          done();
        });
      } catch (err) {
        console.error("contact_queryContactsByPhoneNumber_nop022 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryContactsByPhoneNumber_nop022----after----');
      done()
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop023
     * @tc.name       : contact_queryContactsByEmail_nop023
     * @tc.desc       : Using the contact_queryContactsByEmail_nop023 (context、Email、holder、attrs) then method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryContactsByEmail_nop023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryContactsByEmail_nop023----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, 'xxx@email.com', {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, {
          attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
        }).then((data) => {
          console.log(`contact_queryContactsByEmail_nop023 success: data->${JSON.stringify(data)}`);
          try{
            expect().assertFail();
          }catch(err){
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`contact_queryContactsByEmail_nop023 fail: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("contact_queryContactsByEmail_nop023 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryContactsByEmail_nop023----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop024
     * @tc.name       : contact_queryContactsByEmail_nop024
     * @tc.desc       : Using the contact_queryContactsByEmail_nop024 (context、Email、holder、attrs) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryContactsByEmail_nop024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryContactsByEmail_nop024----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, 'xxx@email.com', {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, {
          attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
        }, (err: BusinessError, data) => {
          if (err) {
            console.log(`contact_queryContactsByEmail_nop024 callback: err->${JSON.stringify(err)}`);
            try{
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            }catch(err){
              console.log(`contact_queryContactsByEmail_nop024 callback: err->${JSON.stringify(err)}`);
            }
            done();
          }
          console.log(`contact_queryContactsByEmail_nop024 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_queryContactsByEmail_nop024 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryContactsByEmail_nop024----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop025
     * @tc.name       : contact_queryContacts_nop025
     * @tc.desc       : Using the contact_queryContacts_nop025 (context,holder,attrs) then method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryContacts_nop025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryContacts_nop025----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContacts(context, {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        }).then((data) => {
          console.log(`contact_queryContacts_nop025 success: data->${JSON.stringify(data)}`);
          try{
            expect().assertFail();
          }catch(err){
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`contact_queryContacts_nop025 fail: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("contact_queryContacts_nop025 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryContacts_nop025----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop026
     * @tc.name       : contact_queryContacts_nop026
     * @tc.desc       : Using the contact_queryContacts_nop026 (context,holder,attrs) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryContacts_nop026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryContacts_nop026----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContacts(context, {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        }, (err: BusinessError, data) => {
          if (err) {
            console.log(`contact_queryContacts_nop026 callback: err->${JSON.stringify(err)}`);
            try{
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            }catch(err){
              console.log(`contact_queryContacts_nop026 callback: err->${JSON.stringify(err)}`);
            }
            done();
          }
          console.log(`contact_queryContacts_nop026 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_queryContacts_nop026 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryContacts_nop026----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop027
     * @tc.name       : contact_queryContacts_nop027
     * @tc.desc       : Using the contact_queryContacts_nop027 (context,holder) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryContacts_nop027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryContacts_nop027----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContacts(context, {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, (err: BusinessError, data) => {
          if (err) {
            console.log(`contact_queryContacts_nop027 callback: err->${JSON.stringify(err)}`);
            try{
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            }catch(err){
              console.log(`contact_queryContacts_nop027 callback: err->${JSON.stringify(err)}`);
            }
            done();
          }
          console.log(`contact_queryContacts_nop027 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_queryContacts_nop027 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryContacts_nop027----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop028
     * @tc.name       : contact_queryContact_nop028
     * @tc.desc       : Using the contact_queryContact_nop028 (context,key,holder,attrs) then method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryContact_nop028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryContact_nop028----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        let promise = contact.queryContact(context, 'xxx', {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        });
        promise.then((data) => {
          console.log(`queryContact success: data->${JSON.stringify(data)}`);
          try{
            expect().assertFail();
          }catch(err){
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`queryContact fail: err->${JSON.stringify(err)}`);
          try{
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          }catch(err){
            console.error(`queryContact fail: err->${JSON.stringify(err)}`);
          }
          done();
        });
      } catch (err) {
        console.error("contact_queryContact_nop028 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryContact_nop028----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop029
     * @tc.name       : contact_queryContact_nop029
     * @tc.desc       : Using the contact_queryContact_nop029 (context,key,holder) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryContact_nop029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryContact_nop029----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContact(context, 'xxx', {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, (err: BusinessError, data) => {
          if (err) {
            console.log(`contact_queryContact_nop029 callback: err->${JSON.stringify(err)}`);
            try{
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            }catch(err){
              console.log(`contact_queryContact_nop029 callback: err->${JSON.stringify(err)}`);
            }
            done();
          }
          console.log(`contact_queryContact_nop029 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_queryContact_nop029 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryContact_nop029----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop030
     * @tc.name       : contact_queryContact_nop030
     * @tc.desc       : Using the contact_queryContact_nop030 (context,key,holder,attrs) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryContact_nop030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryContact_nop030----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContact(context, 'xxx', {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        }, (err: BusinessError, data) => {
          if (err) {
            console.log(`contact_queryContact_nop030 callback: err->${JSON.stringify(err)}`);
            try{
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            }catch(err){
              console.log(`contact_queryContact_nop030 callback: err->${JSON.stringify(err)}`);
            }
            done();
          }
          console.log(`contact_queryContact_nop030 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_queryContact_nop030 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryContact_nop030----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop031
     * @tc.name       : contact_queryKey_nop031
     * @tc.desc       : Using the contact_queryKey_nop031 (context,id,holder) then method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryKey_nop031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryKey_nop031----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryKey(context, /*id*/1, {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }).then((data) => {
          console.log(`contact_queryKey_nop031 success: data->${JSON.stringify(data)}`);
          try{
            expect().assertFail();
          }catch(err){
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`contact_queryKey_nop031 fail: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("contact_queryKey_nop031 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryKey_nop031----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop032
     * @tc.name       : contact_queryKey_nop032
     * @tc.desc       : Using the contact_queryKey_nop032 (context,id,holder) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryKey_nop032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryKey_nop032----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryKey(context, /*id*/1, {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, (err: BusinessError, data) => {
          if (err) {
            console.log(`contact_queryKey_nop032 callback: err->${JSON.stringify(err)}`);
            try{
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            }catch(err){
              console.log(`contact_queryKey_nop032 callback: err->${JSON.stringify(err)}`);
            }
            done();
          }
          console.log(`contact_queryKey_nop032 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_queryKey_nop032 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryKey_nop032----after----');
    })

    /**
     * @tc.number     : SUB_Telephony_Contact_Nop033
     * @tc.name       : contact_queryGroups_nop033
     * @tc.desc       : Using the contact_queryGroups_nop033 (context,holder) callback method without permission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("contact_queryGroups_nop033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryGroups_nop033----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryGroups(context, {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, (err: BusinessError, data) => {
          if (err) {
            console.log(`contact_queryGroups_nop033 callback: err->${JSON.stringify(err)}`);
            try{
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            }catch(err){
              console.log(`contact_queryGroups_nop033 callback: err->${JSON.stringify(err)}`);
            }
            done();
          }
          console.log(`contact_queryGroups_nop033 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("contact_queryGroups_nop033 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------contact_queryGroups_nop033----after----');
    })
  })
}

