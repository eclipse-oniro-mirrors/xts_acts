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
     * @tc.number SUB_Telephony_Contact_Nop001
     * @tc.name SUB_Telephony_Contact_Nop001
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop001----before----');
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
          console.error(`SUB_Telephony_Contact_Nop001 callback: success data->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop001 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop001----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop002
     * @tc.name SUB_Telephony_Contact_Nop002
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop002----before----');
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
          console.log(`SUB_Telephony_Contact_Nop002 success: data->${JSON.stringify(data)}`);
          try{
            expect().assertFail();
          }catch(err){
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`SUB_Telephony_Contact_Nop002 fail: err->${JSON.stringify(err)}`);

          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();

        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop002 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop002----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop003
     * @tc.name SUB_Telephony_Contact_Nop003
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop003----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.deleteContact(context, 'xxx', (err: BusinessError) => {
          console.error(`SUB_Telephony_Contact_Nop003 fail: err->${JSON.stringify(err)}`);

          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();

        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop003 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop003----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop004
     * @tc.name SUB_Telephony_Contact_Nop004
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop004----before----');
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
          console.error(`SUB_Telephony_Contact_Nop004 fail: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop004 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop004----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop005
     * @tc.name SUB_Telephony_Contact_Nop005
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop005----before----');
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
          console.log(`SUB_Telephony_Contact_Nop005 success`);
          try{
            expect().assertFail();
          }catch(err){
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`SUB_Telephony_Contact_Nop005 fail: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop005 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop005----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop006
     * @tc.name SUB_Telephony_Contact_Nop006
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop006----before----');
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
          console.log(`SUB_Telephony_Contact_Nop006 success`);
          try{
            expect().assertFail();
          }catch(err){
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`SUB_Telephony_Contact_Nop006 fail: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop006 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop006----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop007
     * @tc.name SUB_Telephony_Contact_Nop007
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop007----before----');
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
        console.error("SUB_Telephony_Contact_Nop007 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop007----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop008
     * @tc.name SUB_Telephony_Contact_Nop008
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop008----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByPhoneNumber(context, '138xxxxxxxx', (err: BusinessError, data) => {
          console.error(`SUB_Telephony_Contact_Nop008 fail: data->${JSON.stringify(data)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop008 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop008----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop009
     * @tc.name SUB_Telephony_Contact_Nop009
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop009----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.isLocalContact(context, /*id*/1, (err: BusinessError, data) => {
          if (err) {
            console.log(`SUB_Telephony_Contact_Nop009 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`isLocalContact callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop009 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop009----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop010
     * @tc.name SUB_Telephony_Contact_Nop010
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop010----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, 'xxx@email.com', (err: BusinessError, data) => {
          if (err) {
            console.log(`SUB_Telephony_Contact_Nop010 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`SUB_Telephony_Contact_Nop010 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop010 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop010----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop011
     * @tc.name SUB_Telephony_Contact_Nop011
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop011----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, 'xxx@email.com', (err: BusinessError, data) => {
          if (err) {
            console.log(`SUB_Telephony_Contact_Nop011 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`SUB_Telephony_Contact_Nop011 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop011 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop011----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop012
     * @tc.name SUB_Telephony_Contact_Nop012
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop012----before----');
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
        console.error("SUB_Telephony_Contact_Nop012 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop012----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop013
     * @tc.name SUB_Telephony_Contact_Nop013
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop013----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContacts(context, (err: BusinessError, data) => {
          if (err) {
            console.log(`SUB_Telephony_Contact_Nop013 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`SUB_Telephony_Contact_Nop013 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop013 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop013----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop014
     * @tc.name SUB_Telephony_Contact_Nop014
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop014----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContacts(context, {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        }, (err: BusinessError, data) => {
          if (err) {
            console.log(`SUB_Telephony_Contact_Nop014 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`SUB_Telephony_Contact_Nop014 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop014 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop014----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop015
     * @tc.name SUB_Telephony_Contact_Nop015
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop015----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContact(context, 'xxx', {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        }, (err: BusinessError, data) => {
          if (err) {
            console.log(`SUB_Telephony_Contact_Nop015 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`SUB_Telephony_Contact_Nop015 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop015 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop015----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop016
     * @tc.name SUB_Telephony_Contact_Nop016
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop016----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContact(context, 'xxx', (err: BusinessError, data) => {
          if (err) {
            console.log(`SUB_Telephony_Contact_Nop016 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`SUB_Telephony_Contact_Nop016 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop016 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop016----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop017
     * @tc.name SUB_Telephony_Contact_Nop017
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop017----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryKey(context, /*id*/1, (err: BusinessError, data) => {
          if (err) {
            console.log(`SUB_Telephony_Contact_Nop017 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`SUB_Telephony_Contact_Nop017 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop017 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop017----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop018
     * @tc.name SUB_Telephony_Contact_Nop018
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop018----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryGroups(context, (err: BusinessError, data) => {
          if (err) {
            console.log(`SUB_Telephony_Contact_Nop018 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`SUB_Telephony_Contact_Nop018 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop018 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop018----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop019
     * @tc.name SUB_Telephony_Contact_Nop019
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop019----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.isMyCard(context, /*id*/1, (err: BusinessError, data) => {
          if (err) {
            console.log(`SUB_Telephony_Contact_Nop019 callback: err->${JSON.stringify(err)}`);
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          }
          console.log(`SUB_Telephony_Contact_Nop019 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop019 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop019----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop020
     * @tc.name SUB_Telephony_Contact_Nop020
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop020----before----');
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
        console.error("SUB_Telephony_Contact_Nop020 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop020----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop021
     * @tc.name SUB_Telephony_Contact_Nop021
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop021----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByPhoneNumber(context, '138xxxxxxxx', {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        }).then((data) => {
          console.log(`SUB_Telephony_Contact_Nop021 success: data->${JSON.stringify(data)}`);
          try{
            expect().assertFail();
          }catch(err){
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`SUB_Telephony_Contact_Nop021 fail: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop021 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop021----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop022
     * @tc.name SUB_Telephony_Contact_Nop022
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop022----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByPhoneNumber(context, '138xxxxxxxx', {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, (err: BusinessError, data) => {
          console.error(`SUB_Telephony_Contact_Nop022 callback: fail: err->${JSON.stringify(err)}`);
          try{
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          }catch(err){
            console.error(`SUB_Telephony_Contact_Nop022 callback: fail: err->${JSON.stringify(err)}`);
          }
          done();
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop022 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop022----after----');
      done()
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop023
     * @tc.name SUB_Telephony_Contact_Nop023
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop023----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContactsByEmail(context, 'xxx@email.com', {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, {
          attributes: [contact.Attribute.ATTR_EMAIL, contact.Attribute.ATTR_NAME]
        }).then((data) => {
          console.log(`SUB_Telephony_Contact_Nop023 success: data->${JSON.stringify(data)}`);
          try{
            expect().assertFail();
          }catch(err){
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`SUB_Telephony_Contact_Nop023 fail: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop023 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop023----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop024
     * @tc.name SUB_Telephony_Contact_Nop024
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop024----before----');
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
            console.log(`SUB_Telephony_Contact_Nop024 callback: err->${JSON.stringify(err)}`);
            try{
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            }catch(err){
              console.log(`SUB_Telephony_Contact_Nop024 callback: err->${JSON.stringify(err)}`);
            }
            done();
          }
          console.log(`SUB_Telephony_Contact_Nop024 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop024 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop024----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop025
     * @tc.name SUB_Telephony_Contact_Nop025
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop025----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContacts(context, {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, {
          attributes: [contact.Attribute.ATTR_NAME, contact.Attribute.ATTR_PHONE]
        }).then((data) => {
          console.log(`SUB_Telephony_Contact_Nop025 success: data->${JSON.stringify(data)}`);
          try{
            expect().assertFail();
          }catch(err){
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`SUB_Telephony_Contact_Nop025 fail: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop025 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop025----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop026
     * @tc.name SUB_Telephony_Contact_Nop026
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop026----before----');
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
            console.log(`SUB_Telephony_Contact_Nop026 callback: err->${JSON.stringify(err)}`);
            try{
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            }catch(err){
              console.log(`SUB_Telephony_Contact_Nop026 callback: err->${JSON.stringify(err)}`);
            }
            done();
          }
          console.log(`SUB_Telephony_Contact_Nop026 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop026 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop026----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop027
     * @tc.name SUB_Telephony_Contact_Nop027
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop027----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContacts(context, {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, (err: BusinessError, data) => {
          if (err) {
            console.log(`SUB_Telephony_Contact_Nop027 callback: err->${JSON.stringify(err)}`);
            try{
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            }catch(err){
              console.log(`SUB_Telephony_Contact_Nop027 callback: err->${JSON.stringify(err)}`);
            }
            done();
          }
          console.log(`SUB_Telephony_Contact_Nop027 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop027 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop027----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop028
     * @tc.name SUB_Telephony_Contact_Nop028
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop028----before----');
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
        console.error("SUB_Telephony_Contact_Nop028 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop028----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop029
     * @tc.name SUB_Telephony_Contact_Nop029
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop029----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryContact(context, 'xxx', {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, (err: BusinessError, data) => {
          if (err) {
            console.log(`SUB_Telephony_Contact_Nop029 callback: err->${JSON.stringify(err)}`);
            try{
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            }catch(err){
              console.log(`SUB_Telephony_Contact_Nop029 callback: err->${JSON.stringify(err)}`);
            }
            done();
          }
          console.log(`SUB_Telephony_Contact_Nop029 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop029 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop029----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop030
     * @tc.name SUB_Telephony_Contact_Nop030
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop030----before----');
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
            console.log(`SUB_Telephony_Contact_Nop030 callback: err->${JSON.stringify(err)}`);
            try{
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            }catch(err){
              console.log(`SUB_Telephony_Contact_Nop030 callback: err->${JSON.stringify(err)}`);
            }
            done();
          }
          console.log(`SUB_Telephony_Contact_Nop030 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop030 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop030----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop031
     * @tc.name SUB_Telephony_Contact_Nop031
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop031----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryKey(context, /*id*/1, {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }).then((data) => {
          console.log(`SUB_Telephony_Contact_Nop031 success: data->${JSON.stringify(data)}`);
          try{
            expect().assertFail();
          }catch(err){
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`SUB_Telephony_Contact_Nop031 fail: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop031 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop031----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop032
     * @tc.name SUB_Telephony_Contact_Nop032
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop032----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryKey(context, /*id*/1, {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, (err: BusinessError, data) => {
          if (err) {
            console.log(`SUB_Telephony_Contact_Nop032 callback: err->${JSON.stringify(err)}`);
            try{
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            }catch(err){
              console.log(`SUB_Telephony_Contact_Nop032 callback: err->${JSON.stringify(err)}`);
              expect(false).assertTrue();
            }
            done();
          }
          console.log(`SUB_Telephony_Contact_Nop032 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop032 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop032----after----');
    })

    /**
     * @tc.number SUB_Telephony_Contact_Nop033
     * @tc.name SUB_Telephony_Contact_Nop033
     * @tc.desc Function test
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Contact_Nop033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------contact_queryGroups_nop033----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        contact.queryGroups(context, {
          holderId: 0,
          bundleName: "",
          displayName: ""
        }, (err: BusinessError, data) => {
          if (err) {
            console.log(`SUB_Telephony_Contact_Nop033 callback: err->${JSON.stringify(err)}`);
            try{
              expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            }catch(err){
              console.log(`SUB_Telephony_Contact_Nop033 callback: err->${JSON.stringify(err)}`);
              expect(false).assertTrue();
            }
            done();
          }
          console.log(`SUB_Telephony_Contact_Nop033 callback: success data->${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop033 error:" + JSON.stringify(err));
        expect(false).assertTrue();
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop033----after----');
    })

    /**
     * @tc.name SUB_Telephony_Contact_Nop034
     * @tc.number SUB_Telephony_Contact_Nop034
     * @tc.desc Using the SUB_Telephony_Contact_Nop034 (context, contact.Contact[]) promise method without permission
     * @tc.type  FUNCTION
     * @tc.size  MEDIUMTEST
     * @tc.level LEVEL3
     */
    it("SUB_Telephony_Contact_Nop034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------SUB_Telephony_Contact_Nop034----before----');
      try {
        let context: Context = AppStorage.get('context') as Context;
        const contactData: contact.Contact = {
          name: {
            fullName: 'abc'
          },
          phoneNumbers: [{
            phoneNumber: '13800000000'
          }]
        };
        const promise = contact.addContacts(context,[contactData]);
        promise.then((data) => {
          console.log(`SUB_Telephony_Contact_Nop034 queryContact success: data->${JSON.stringify(data)}`);
          try {
            expect().assertFail();
          } catch (err) {
            done();
          }
        }).catch((err: BusinessError) => {
          try {
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          } catch (err) {
            console.log(`SUB_Telephony_Contact_Nop034 promise: err->${JSON.stringify(err)}`);
          }
          done();
        })
      } catch (err) {
        console.error("SUB_Telephony_Contact_Nop034 error:" + JSON.stringify(err));
        done()
      }
      console.info('--------SUB_Telephony_Contact_Nop034----after----');
    })
  })
}

