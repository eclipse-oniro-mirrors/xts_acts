/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, afterEach, it, expect, beforeEach, Level, Size, TestType } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import { Component, Driver, On, ON } from '@ohos.UiTest';

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

function sleep (time:number):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}

async function getComponent(driver: Driver, onType: On) {
    let item:Component = await driver.findComponent(onType);
    if(!item) {
        await getComponent(driver, onType);
    } else {
        console.log(`get component: ${JSON.stringify(item)}`);
        await item.click();
    }
}

export default function EmptyParamTest() {
    describe('EmptyParamTest', () => {

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
                    contactList = await contact.queryContactsByPhoneNumber(context,"13800000000");
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
     * @tc.name   contactsApi_insert_empty_test_100
     * @tc.number contactsApi_insert_empty_test_100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_insert_empty_test_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let contactDataError: contact.Contact = {};
        try {
            let context: Context = AppStorage.get('context') as Context;
            let rawContactId = await contact.addContact(context, contactDataError);
            console.info("contactsApi_insert_empty_test_100: rawContactId = " + rawContactId);
            expect().assertFail();
            done();
        } catch (error) {
            console.info("contactsApi_insert_empty_test_100: raw_contact insert error = " + error);
            expect(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_insert_empty_test_200
     * @tc.number contactsApi_insert_empty_test_200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_insert_empty_test_200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let contactDataError: contact.Contact = {};
        try {
            let context: Context = AppStorage.get('context') as Context;
            contact.addContact(context, contactDataError, (err: BusinessError, rawContactId: number) => {
                console.info("contactsApi_insert_empty_test_200: rawContactId = " + rawContactId);
                if (err) {
                    expect(err.code === 401).assertTrue();
                } else {
                    expect().assertFail();
                }
                done();
            });
        } catch (error) {
            console.info("contactsApi_insert_empty_test_200: raw_contact insert error = " + error);
            expect(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_delete_empty_test_500
     * @tc.number contactsApi_delete_empty_test_500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_delete_empty_test_500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const key: string = '';
            await contact.deleteContact(context, key);
            console.info("contactsApi_delete_empty_test_500: delete success");
            expect().assertFail();
            done();
        } catch (error) {
            console.info("contactsApi_delete_empty_test_500: raw_contact delete error = " + error);
            expect(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_delete_empty_test_600
     * @tc.number contactsApi_delete_empty_test_600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_delete_empty_test_600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const key: string = '';
            contact.deleteContact(context, key, (err: BusinessError) => {
                if (err) {
                    console.info("contactsApi_delete_empty_test_600: delete err: " + err);
                    expect(err.code === 401).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_delete_empty_test_600: delete success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_delete_empty_test_600: raw_contact delete error = " + error);
            expect(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_delete_empty_test_700
     * @tc.number contactsApi_delete_empty_test_700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_delete_empty_test_700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const key: string = '';
            await contact.deleteContact(undefined, key).then(() => {
                console.info("contactsApi_delete_empty_test_700: delete success");
                done();
            }).catch((error: BusinessError) => {
                console.info(`contactsApi_delete_empty_test_700: raw_contact delete error: ${error.code}, ${error.message}`);
                expect(error.code === 401).assertTrue();
                done();
            });
        } catch (error) {
            console.info(`contactsApi_delete_empty_test_700: raw_contact delete error = ${error.code}, ${error.message}`);
            expect(error.code === 401).assertTrue();
            done();
        }
    });

    
    /**
     * @tc.name   contactsApi_delete_empty_test_800
     * @tc.number contactsApi_delete_empty_test_800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_delete_empty_test_800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const key: string = '';
            contact.deleteContact(undefined, key, (err: BusinessError) => {
                if (err) {
                    console.info(`contactsApi_delete_empty_test_800: delete failed: ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_delete_empty_test_800: delete success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info("contactsApi_delete_empty_test_800: raw_contact delete error = " + error);
            expect(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_900
     * @tc.number contactsApi_query_empty_test_900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('null') as Context;
            await contact.queryContact(context, '').then(() => {
                console.info("contactsApi_query_empty_test_900: query success");
                done();
            }).catch((error: BusinessError) => {
                console.info(`contactsApi_query_empty_test_900: contact query error: ${error.code}, ${error.message}`);
                expect(error).assertTrue();
                done();
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_900: contact query error = ${error.code}, ${error.message}`);
            expect(error).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_1000
     * @tc.number contactsApi_query_empty_test_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('null') as Context;
            const key: string = '';
            contact.queryContact(context, key, (err: BusinessError) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_1000: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_1000: query success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_1000: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_1100
     * @tc.number contactsApi_query_empty_test_1100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('null') as Context;
            await contact.queryContacts(context).then((contacts: contact.Contact[]) => {
                console.info("contactsApi_query_empty_test_1100: query success");
                done();
            }).catch((error: BusinessError) => {
                console.info(`contactsApi_query_empty_test_1100: contact query error: ${error.code}, ${error.message}`);
                expect(error).assertTrue();
                done();
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_1100: contact query error = ${error.code}, ${error.message}`);
            expect(error).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_1200
     * @tc.number contactsApi_query_empty_test_1200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            contact.queryContacts(null, (err: BusinessError) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_1200: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_1200: query success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_1200: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_1300
     * @tc.number contactsApi_query_empty_test_1300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            let contactAttributes: contact.ContactAttributes = {
                attributes: []
            };
            await contact.queryContacts(null, null, contactAttributes).then(() => {
                console.info("contactsApi_query_empty_test_1300: query success");
                done();
            }).catch((error: BusinessError) => {
                console.info(`contactsApi_query_empty_test_1300: contact query error: ${error.code}, ${error.message}`);
                expect(error.code === 401).assertTrue();
                done();
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_1300: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_1400
     * @tc.number contactsApi_query_empty_test_1400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            let contactAttributes: contact.ContactAttributes = {
                attributes: []
            };
            contact.queryContacts(null, null, contactAttributes, (err: BusinessError, contacts: contact.Contact[]) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_1400: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_1400: query success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_1400: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });


    /**
     * @tc.name   contactsApi_query_empty_test_1500
     * @tc.number contactsApi_query_empty_test_1500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const email: string = '';
            await contact.queryContactsByEmail(null, email).then(() => {
                console.info("contactsApi_query_empty_test_1500: query success");
                done();
            }).catch((error: BusinessError) => {
                console.info(`contactsApi_query_empty_test_1500: contact query error: ${error.code}, ${error.message}`);
                expect(error.code === 401).assertTrue();
                done();
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_1500: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_1600
     * @tc.number contactsApi_query_empty_test_1600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const email: string = '';
            contact.queryContactsByEmail(null, email, (err: BusinessError, contacts: contact.Contact[]) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_1600: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_1600: query success: " + contacts.length);
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_1600: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_1700
     * @tc.number contactsApi_query_empty_test_1700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const phoneNumber: string = '';
            await contact.queryContactsByPhoneNumber(null, phoneNumber).then(() => {
                console.info("contactsApi_query_empty_test_1700: query success");
                done();
            }).catch((error: BusinessError) => {
                console.info(`contactsApi_query_empty_test_1700: contact query error: ${error.code}, ${error.message}`);
                expect(error.code === 401).assertTrue();
                done();
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_1700: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_1800
     * @tc.number contactsApi_query_empty_test_1800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('context') as Context;
            const phoneNumber: string = '';
            let contactAttributes: contact.ContactAttributes = {
                attributes: []
            };
            contact.queryContactsByPhoneNumber(null, phoneNumber, contactAttributes, (err: BusinessError, contacts: contact.Contact[]) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_1800: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_1800: query success: " + contacts.length);
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_1800: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_1900
     * @tc.number contactsApi_query_empty_test_1900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('null') as Context;
            await contact.queryGroups(context).then(() => {
                console.info("contactsApi_query_empty_test_1900: query success");
                done();
            }).catch((error: BusinessError) => {
                console.info(`contactsApi_query_empty_test_1900: contact query error: ${error.code}, ${error.message}`);
                expect(error.code === 401).assertTrue();
                done();
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_1900: group query error = ${error.code}, ${error.message}`);
            expect(error.code === 401).assertTrue();
            done();
        }
    });


    /**
     * @tc.name   contactsApi_query_empty_test_2000
     * @tc.number contactsApi_query_empty_test_2000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            contact.queryGroups(null, (err: BusinessError, groups: contact.Group[]) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_2000: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_2000: query success: " + groups.length);
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_2000: group query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_2100
     * @tc.number contactsApi_query_empty_test_2100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            contact.queryGroups(null, null, (err: BusinessError, groups: contact.Group[]) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_2100: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_2100: query success: " + groups.length);
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_2100: group query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_2200
     * @tc.number contactsApi_query_empty_test_2200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('null') as Context;
            const holders = await contact.queryHolders(context).then(() => {
                console.info("contactsApi_query_empty_test_2200: query success");
                done();
            }).catch((error: BusinessError) => {
                console.info(`contactsApi_query_empty_test_2200: contact query error: ${error.code}, ${error.message}`);
                expect(error.code === 401).assertTrue();
                done();
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_2200: holders query error = ${error.code}, ${error.message}`);
            expect(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_2300
     * @tc.number contactsApi_query_empty_test_2300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            contact.queryHolders(null, (err: BusinessError, holders: contact.Holder[]) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_2300: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_2300: query success: " + holders.length);
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_2300: group query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_2400
     * @tc.number contactsApi_query_empty_test_2400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('null') as Context;
            const keys = await contact.queryKey(context, null).then(() => {
                console.info("contactsApi_query_empty_test_2400: query success");
                done();
            }).catch((error: BusinessError) => {
                console.info(`contactsApi_query_empty_test_2400: contact query error: ${error.code}, ${error.message}`);
                expect(error.code === 401).assertTrue();
                done();
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_2400: query error = ${error.code}, ${error.message}`);
            expect(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_2500
     * @tc.number contactsApi_query_empty_test_2500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            contact.queryKey(null, null, (err: BusinessError, key:string) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_2500: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_2500: query success: " + key);
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_2500: query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_2600
     * @tc.number contactsApi_query_empty_test_2600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            contact.queryKey(null, null, null, (err: BusinessError, key:string) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_2600: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_2600: query success: " + key);
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_2600: query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_2700
     * @tc.number contactsApi_query_empty_test_2700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('null') as Context;
            const card = await contact.queryMyCard(context).then(() => {
                console.info("contactsApi_query_empty_test_2700: query success");
                done();
            }).catch((error: BusinessError) => {
                console.info(`contactsApi_query_empty_test_2700: contact query error: ${error.code}, ${error.message}`);
                expect(error.code === 401).assertTrue();
                done();
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_2700: query error = ${error.code}, ${error.message}`);
            expect(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_2800
     * @tc.number contactsApi_query_empty_test_2800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            contact.queryMyCard(null, (err: BusinessError, card: contact.Contact) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_2800: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_2800: query success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_2800: query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_2900
     * @tc.number contactsApi_query_empty_test_2900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            contact.queryMyCard(null, null, (err: BusinessError, card: contact.Contact) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_2900: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_2900: query success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_2900: query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_update_empty_test_3000
     * @tc.number contactsApi_update_empty_test_3000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_update_empty_test_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('null') as Context;
            let contactDataError: contact.Contact = {};
            const card = await contact.updateContact(context, contactDataError).then(() => {
                console.info("contactsApi_update_empty_test_3000: query success");
                done();
            }).catch((error: BusinessError) => {
                console.info(`contactsApi_update_empty_test_3000: contact query error: ${error.code}, ${error.message}`);
                expect(error.code === 401).assertTrue();
                done();
            });
        } catch (error) {
            console.info(`contactsApi_update_empty_test_3000: update error = ${error.code}, ${error.message}`);
            expect(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_update_empty_test_3100
     * @tc.number contactsApi_update_empty_test_3100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_update_empty_test_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let contactDataError: contact.Contact = {};
            contact.updateContact(null, contactDataError, (err: BusinessError) => {
                if (err) {
                    console.error(`contactsApi_update_empty_test_3100: contact update err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_update_empty_test_3100: update success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_update_empty_test_3100: update error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_update_empty_test_3200
     * @tc.number contactsApi_update_empty_test_3200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_update_empty_test_3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let contactDataError: contact.Contact = {};
            contact.updateContact(null, contactDataError, null, (err: BusinessError) => {
                if (err) {
                    console.error(`contactsApi_update_empty_test_3200: contact update err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_update_empty_test_3200: update success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_update_empty_test_3200: update error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_is_local_contact_empty_test_3300
     * @tc.number contactsApi_is_local_contact_empty_test_3300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_is_local_contact_empty_test_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            let context: Context = AppStorage.get('null') as Context;
            const isLocalContact = await contact.isLocalContact(context, null).then(() => {
                console.info("contactsApi_is_local_contact_empty_test_3300: query success");
                done();
            }).catch((error: BusinessError) => {
                console.info(`contactsApi_is_local_contact_empty_test_3300: contact query error: ${error.code}, ${error.message}`);
                expect(error.code === 401).assertTrue();
                done();
            });
        } catch (error) {
            console.info(`contactsApi_is_local_contact_empty_test_3300: isLocalContact error = ${error.code}, ${error.message}`);
            expect(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_is_local_contact_empty_test_3400
     * @tc.number contactsApi_is_local_contact_empty_test_3400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_is_local_contact_empty_test_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            contact.isLocalContact(null, null, (err: BusinessError, isLocalContact: boolean) => {
                if (err) {
                    console.error(`contactsApi_is_local_contact_empty_test_3400: contact isLocalContact err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_is_local_contact_empty_test_3400: isLocalContact success: " + isLocalContact);
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_is_local_contact_empty_test_3400: isLocalContact error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_3200
     * @tc.number contactsApi_query_empty_test_3200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const testCaseName: string = 'contactsApi_query_empty_test_3200';
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_3200 test start");
            let context: Context = AppStorage.get('context') as Context;
            const email: string = '';
            const holder: contact.Holder = AppStorage.get('null') as contact.Holder;
            contact.queryContactsByEmail(null, email, holder, (err: BusinessError, contacts: contact.Contact[]) => {
                if (err) {
                    console.error(`${testCaseName}: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info(`${testCaseName} : query success: ${contacts.length}`);
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`${testCaseName} : contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_3300
     * @tc.number contactsApi_query_empty_test_3300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const testCaseName: string = 'contactsApi_query_empty_test_3300';
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_3300 test start");
            let context: Context = AppStorage.get('context') as Context;
            const email: string = '';
            const attr: contact.ContactAttributes = AppStorage.get('null') as contact.ContactAttributes;
            contact.queryContactsByEmail(null, email, attr, (err: BusinessError, contacts: contact.Contact[]) => {
                if (err) {
                    console.error(`${testCaseName}: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info(`${testCaseName} : query success: ${contacts.length}`);
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`${testCaseName} : contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });



    /**
     * @tc.name   contactsApi_query_empty_test_3400
     * @tc.number contactsApi_query_empty_test_3400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const testCaseName: string = 'contactsApi_query_empty_test_3400';
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_3400 test start");
            let context: Context = AppStorage.get('context') as Context;
            const email: string = '';
            const holder: contact.Holder = AppStorage.get('null') as contact.Holder;
            const attr: contact.ContactAttributes = AppStorage.get('null') as contact.ContactAttributes;
            contact.queryContactsByEmail(null, email, holder, attr, (err: BusinessError, contacts: contact.Contact[]) => {
                if (err) {
                    console.error(`${testCaseName}: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info(`${testCaseName} : query success: ${contacts.length}`);
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`${testCaseName} : contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_3500
     * @tc.number contactsApi_query_empty_test_3500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const testCaseName: string = 'contactsApi_query_empty_test_3500';
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_3500 test start");
            let context: Context = AppStorage.get('context') as Context;
            const email: string = '';
            let contactAttributes: contact.ContactAttributes = {
                attributes: []
            };
            contact.queryContactsByEmail(null, email, contactAttributes, (err: BusinessError, contacts: contact.Contact[]) => {
                if (err) {
                    console.error(`${testCaseName}: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info(`${testCaseName} : query success: ${contacts.length}`);
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`${testCaseName} : contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_3600
     * @tc.number contactsApi_query_empty_test_3600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const testCaseName: string = 'contactsApi_query_empty_test_3600';
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_3600 test start");
            let context: Context = AppStorage.get('context') as Context;
            const email: string = '';
            const holder: contact.Holder = AppStorage.get('null') as contact.Holder;
            let contactAttributes: contact.ContactAttributes = {
                attributes: []
            };
            contact.queryContactsByEmail(null, email, holder, contactAttributes, (err: BusinessError, contacts: contact.Contact[]) => {
                if (err) {
                    console.error(`${testCaseName}: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info(`${testCaseName} : query success: ${contacts.length}`);
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`${testCaseName} : contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_3700
     * @tc.number contactsApi_query_empty_test_3700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const testCaseName: string = 'contactsApi_query_empty_test_3700';
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_3700 test start");
            let context: Context = AppStorage.get('context') as Context;
            const phoneNumber: string = '';
            const holder: contact.Holder = AppStorage.get('null') as contact.Holder;
            contact.queryContactsByPhoneNumber(null, phoneNumber, holder, (err: BusinessError, contacts: contact.Contact[]) => {
                if (err) {
                    console.error(`${testCaseName}: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info(`${testCaseName} : query success: ${contacts.length}`);
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`${testCaseName} : contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_3800
     * @tc.number contactsApi_query_empty_test_3800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const testCaseName: string = 'contactsApi_query_empty_test_3800';
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_3800 test start");
            let context: Context = AppStorage.get('context') as Context;
            const phoneNumber: string = '';
            const holder: contact.Holder = AppStorage.get('null') as contact.Holder;
            const attr: contact.ContactAttributes = AppStorage.get('null') as contact.ContactAttributes;
            contact.queryContactsByPhoneNumber(null, phoneNumber, holder, attr, (err: BusinessError, contacts: contact.Contact[]) => {
                if (err) {
                    console.error(`${testCaseName}: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info(`${testCaseName} : query success: ${contacts.length}`);
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`${testCaseName} : contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_4500
     * @tc.number contactsApi_query_empty_test_4500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_4500 test start");
            let context: Context = AppStorage.get('null') as Context;
            const key: string = '';
            contact.queryContact(context, key, null, (err: BusinessError) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_4500: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_4500: query success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_4500: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_4600
     * @tc.number contactsApi_query_empty_test_4600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_4600 test start");
            let context: Context = AppStorage.get('context') as Context;
            let contactAttributes: contact.ContactAttributes = {
                attributes: []
            };
            contact.queryContact(null, null, contactAttributes, (err: BusinessError) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_4600: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_4600: query success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_4600: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_4700
     * @tc.number contactsApi_query_empty_test_4700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_4700 test start");
            let context: Context = AppStorage.get('context') as Context;
            contact.queryContact(null, null, null, (err: BusinessError) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_4700: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_4700: query success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_4700: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_4800
     * @tc.number contactsApi_query_empty_test_4800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_4800 test start");
            let context: Context = AppStorage.get('context') as Context;
            contact.queryContact(null, null, null, null, (err: BusinessError) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_4800: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_4800: query success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_4800: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_4900
     * @tc.number contactsApi_query_empty_test_4900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_4900 test start");
            let context: Context = AppStorage.get('context') as Context;
            let contactAttributes: contact.ContactAttributes = {
                attributes: []
            };
            contact.queryContact(null, null, null, contactAttributes, (err: BusinessError) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_4900: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_4900: query success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_4900: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_5000
     * @tc.number contactsApi_query_empty_test_5000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_5000 test start");
            let context: Context = AppStorage.get('null') as Context;
            const holder: contact.Holder = AppStorage.get('null') as contact.Holder;
            const attr: contact.ContactAttributes = AppStorage.get('null') as contact.ContactAttributes;
            let promise = contact.queryContact(context, '', holder, attr);
            promise.then((data) => {
                console.info("contactsApi_query_empty_test_5000: query success");
                done();
            }).catch((error: BusinessError) => {
                console.info(`contactsApi_query_empty_test_5000: contact query error: ${error.code}, ${error.message}`);
                expect(error.code === 201).assertTrue();
                done();
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_5000: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_5100
     * @tc.number contactsApi_query_empty_test_5100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_5100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_5100 test start");
            let context: Context = AppStorage.get('null') as Context;
            let contactAttributes: contact.ContactAttributes = {
                attributes: []
            };
            await contact.queryContact(context, null, null, contactAttributes).then(() => {
                console.info("contactsApi_query_empty_test_5100: query success");
                done();
            }).catch((error: BusinessError) => {
                console.info(`contactsApi_query_empty_test_5100: contact query error: ${error.code}, ${error.message}`);
                expect(error.code === 201).assertTrue();
                done();
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_5100: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_5200
     * @tc.number contactsApi_query_empty_test_5200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_5200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_5200 test start");
            let context: Context = AppStorage.get('context') as Context;
            contact.queryContacts(null, null, (err: BusinessError, contacts: contact.Contact[]) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_5200: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_5200: query success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_5200: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_5300
     * @tc.number contactsApi_query_empty_test_5300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_5300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_5300 test start");
            let context: Context = AppStorage.get('context') as Context;
            contact.queryContacts(null, null, (err: BusinessError, contacts: contact.Contact[]) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_5300: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_5300: query success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_5300: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_5400
     * @tc.number contactsApi_query_empty_test_5400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_5400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_5400 test start");
            let context: Context = AppStorage.get('context') as Context;
            let contactAttributes: contact.ContactAttributes = {
                attributes: []
            };
            contact.queryContacts(null, contactAttributes, (err: BusinessError, contacts: contact.Contact[]) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_5400: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_5400: query success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_5400: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_5500
     * @tc.number contactsApi_query_empty_test_5500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_5500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_5500 test start");
            let context: Context = AppStorage.get('context') as Context;
            contact.queryContacts(null, null, null, (err: BusinessError, contacts: contact.Contact[]) => {
                if (err) {
                    console.error(`contactsApi_query_empty_test_5500: contact query err = ${err.code}, ${err.message}`);
                    expect(err.code === 201).assertTrue();
                    done();
                } else {
                    console.info("contactsApi_query_empty_test_5500: query success");
                    expect().assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_5500: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_empty_test_5600
     * @tc.number contactsApi_query_empty_test_5600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_5600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_5600 test start");
            let context: Context = AppStorage.get('null') as Context;
            let contactAttributes: contact.ContactAttributes = {
                attributes: []
            };
            let promise = contact.queryContacts(context, null, contactAttributes);
            promise.then((data) => {
                console.info("contactsApi_query_empty_test_5600: query success");
                done();
            }).catch((error: BusinessError) => {
                console.info(`contactsApi_query_empty_test_5600: contact query error: ${error.code}, ${error.message}`);
                expect(error.code === 201).assertTrue();
                done();
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_5600: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });


    /**
     * @tc.name   contactsApi_query_empty_test_5700
     * @tc.number contactsApi_query_empty_test_5700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_empty_test_5700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            sleep(500);
            console.info("contactsApi_query_empty_test_5700 test start");
            let context: Context = AppStorage.get('null') as Context;
            const attr: contact.ContactAttributes = AppStorage.get('null') as contact.ContactAttributes;
            let promise = contact.queryContacts(context, {holderId:1,bundleName:"",displayName:""}, attr);
            promise.then((data) => {
                console.info("contactsApi_query_empty_test_5700: query success");
                done();
            }).catch((error: BusinessError) => {
                console.info(`contactsApi_query_empty_test_5700: contact query error: ${error.code}, ${error.message}`);
                expect(error.code === 201).assertTrue();
                done();
            });
        } catch (error) {
            console.info(`contactsApi_query_empty_test_5700: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 201).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_code_test_5800
     * @tc.number contactsApi_query_code_test_5800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_code_test_5800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            sleep(500);
            console.info("contactsApi_query_code_test_5800 test start");
            let context: Context = AppStorage.get('context') as Context;
            const attr: contact.ContactAttributes = AppStorage.get('null') as contact.ContactAttributes;
            contact.queryContact(context, '', attr, (err: BusinessError, data) => {
                if (!err) {
                    console.info(`contactsApi_query_code_test_5800: data->${JSON.stringify(data)}`);
                    expect(data !== undefined).assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_code_test_5800: contact query error = ${error.code}, ${error.message}`);
            expect(error.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   contactsApi_query_code_test_5900
     * @tc.number contactsApi_query_code_test_5900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("contactsApi_query_code_test_5900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            sleep(500);
            console.info("contactsApi_query_code_test_5900 test start");
            let context: Context = AppStorage.get('context') as Context;
            const attr: contact.ContactAttributes = AppStorage.get('null') as contact.ContactAttributes;
            contact.queryMyCard(context, attr, (err: BusinessError, data) => {
                if (!err) {
                    console.info(`contactsApi_query_code_test_5900: data->${JSON.stringify(data)}`);
                    expect(data !== undefined).assertFail();
                    done();
                }
            });
        } catch (error) {
            console.info(`contactsApi_query_code_test_5900: query error = ${error.code}, ${error.message}`);
            expect(error.code === 401).assertTrue();
            done();
        }
    });


    })
}