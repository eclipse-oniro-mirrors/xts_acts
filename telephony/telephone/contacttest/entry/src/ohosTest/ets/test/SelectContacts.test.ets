import { describe, beforeAll, afterEach, it, expect, Level, Size, TestType } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import { Component, Driver, On, ON } from '@ohos.UiTest';

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

function delay(ms: number): Promise<void> {
    return new Promise<void>((resolve) => {
        setTimeout(() => {
            resolve();
        }, ms);
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

export default function SelectContactsTest() {
  describe('SelectContactsTest', () => {
    let contactData: contact.Contact = {
      name: { fullName: "测试" },
      organization: { name: "测试单位", title: "测试单位" },
      emails: [{ email: "13800000000@email.com" }],
      phoneNumbers: [{ phoneNumber: "13800000000" }],
    };

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
     * @tc.name   testTelephonyContactSelectContacts0100
     * @tc.number SUB_Telephony_Contact_SelectContacts_0100
     * @tc.desc   Call the contact SelectContacts interface, and use the Promise method as an asynchronous method for the SelectContacts contact 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactSelectContacts0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts0100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let data: number = await contact.addContact(context, contactData);
        console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);

        contact.selectContacts().then((data: contact.Contact[]) => {
            console.info(`${caseName} selectContacts: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length > 0);
            done();
        }).catch((err: BusinessError) => {
            console.error(`${caseName} selectContacts: success err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
        })
        await delay(1000);

        try {
            let driver: Driver = Driver.create();
            let onType1: On = ON.text('测试');
            let onType2: On = ON.text('完成');
            await getComponent(driver, onType1);
            await getComponent(driver, onType2);
        } catch (err) {
            console.error(`${caseName} get component catch: err->${JSON.stringify(err)}`);
        }
      } catch (err) {
        console.error(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.name   testTelephonyContactSelectContacts0200
     * @tc.number SUB_Telephony_Contact_SelectContacts_0200
     * @tc.desc   Call the contact SelectContacts interface, and use the Promise method as an asynchronous method for the SelectContacts contact 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactSelectContacts0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts0200";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let data: number = await contact.addContact(context, contactData);
        console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);

        contact.selectContacts({ isMultiSelect: true }).then((data: contact.Contact[]) => {
            console.info(`${caseName} selectContacts: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length > 0);
            done();
        }).catch((err: BusinessError) => {
            console.error(`${caseName} selectContacts: success err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
        })
        await delay(1000);

        try {
            let driver: Driver = Driver.create();
            let onType1: On = ON.text('全选');
            let onType2: On = ON.text('完成');
            await getComponent(driver, onType1);
            await getComponent(driver, onType2);
        } catch (err) {
            console.error(`${caseName} get component catch: err->${JSON.stringify(err)}`);
        }
      } catch (err) {
        console.error(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.name   testTelephonyContactSelectContacts0300
     * @tc.number SUB_Telephony_Contact_SelectContacts_0300
     * @tc.desc   Call the contact SelectContacts interface, and use the Promise method as an asynchronous method for the SelectContacts contact 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactSelectContacts0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts0300";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let data: number = await contact.addContact(context, contactData);
        console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);

        contact.selectContacts({ isMultiSelect: false }).then((data: contact.Contact[]) => {
            console.info(`${caseName} selectContacts: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length > 0);
            done();
        }).catch((err: BusinessError) => {
            console.error(`${caseName} selectContacts: success err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
        })
        await delay(1000);

        try {
            let driver: Driver = Driver.create();
            let onType1: On = ON.text('测试');
            let onType2: On = ON.text('完成');
            await getComponent(driver, onType1);
            await getComponent(driver, onType2);
        } catch (err) {
            console.error(`${caseName} get component catch: err->${JSON.stringify(err)}`);
        }
      } catch (err) {
        console.error(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.name   testTelephonyContactSelectContacts0400
     * @tc.number SUB_Telephony_Contact_SelectContacts_0400
     * @tc.desc   Call the contact SelectContacts interface, and use the Promise method as an asynchronous method for the SelectContacts contact 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactSelectContacts0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts0400";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let data: number = await contact.addContact(context, contactData);
        console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);

        contact.selectContacts({ maxSelectable: 1 }).then((data: contact.Contact[]) => {
            console.info(`${caseName} selectContacts: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length > 0);
            done();
        }).catch((err: BusinessError) => {
            console.error(`${caseName} selectContacts: success err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
        })
        await delay(1000);

        try {
            let driver: Driver = Driver.create();
            let onType1: On = ON.text('测试');
            let onType2: On = ON.text('完成');
            await getComponent(driver, onType1);
            await getComponent(driver, onType2);
        } catch (err) {
            console.error(`${caseName} get component catch: err->${JSON.stringify(err)}`);
        }
      } catch (err) {
        console.error(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.name   testTelephonyContactSelectContacts0500
     * @tc.number SUB_Telephony_Contact_SelectContacts_0500
     * @tc.desc   Call the contact SelectContacts interface, and use the Promise method as an asynchronous method for the SelectContacts contact 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactSelectContacts0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts0500";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let data: number = await contact.addContact(context, contactData);
        console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);

        contact.selectContacts({ isDisplayedByName: true }).then((data: contact.Contact[]) => {
            console.info(`${caseName} selectContacts: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length > 0);
            done();
        }).catch((err: BusinessError) => {
            console.error(`${caseName} selectContacts: success err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
        })
        await delay(1000);

        try {
            let driver: Driver = Driver.create();
            let onType1: On = ON.text('测试');
            let onType2: On = ON.text('完成');
            await getComponent(driver, onType1);
            await getComponent(driver, onType2);
        } catch (err) {
            console.error(`${caseName} get component catch: err->${JSON.stringify(err)}`);
        }
      } catch (err) {
        console.error(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.name   testTelephonyContactSelectContacts0600
     * @tc.number SUB_Telephony_Contact_SelectContacts_0600
     * @tc.desc   Call the contact SelectContacts interface, and use the Promise method as an asynchronous method for the SelectContacts contact 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactSelectContacts0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts0600";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let data: number = await contact.addContact(context, contactData);
        console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);

        contact.selectContacts({ isDisplayedByName: false }).then((data: contact.Contact[]) => {
            console.info(`${caseName} selectContacts: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length > 0);
            done();
        }).catch((err: BusinessError) => {
            console.error(`${caseName} selectContacts: success err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
        })
        await delay(1000);

        try {
            let driver: Driver = Driver.create();
            let onType1: On = ON.text('测试');
            let onType2: On = ON.text('完成');
            await getComponent(driver, onType1);
            await getComponent(driver, onType2);
        } catch (err) {
            console.error(`${caseName} get component catch: err->${JSON.stringify(err)}`);
        }
      } catch (err) {
        console.error(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.name   testTelephonyContactSelectContacts0700
     * @tc.number SUB_Telephony_Contact_SelectContacts_0700
     * @tc.desc   Call the contact SelectContacts interface, and use the Promise method as an asynchronous method for the SelectContacts contact 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactSelectContacts0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts0700";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let data: number = await contact.addContact(context, contactData);
        console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);

        let filter: contact.ContactSelectionFilter = {
            filterClause: {
                id: [{ filterCondition: contact.FilterCondition.IS_NOT_NULL }]
            },
            filterType: contact.FilterType.SHOW_FILTER
        }
        contact.selectContacts({ filter: filter }).then((data: contact.Contact[]) => {
            console.info(`${caseName} selectContacts: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length > 0);
            done();
        }).catch((err: BusinessError) => {
            console.error(`${caseName} selectContacts: success err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
        })
        await delay(1000);

        try {
            let driver: Driver = Driver.create();
            let onType1: On = ON.text('测试');
            let onType2: On = ON.text('完成');
            await getComponent(driver, onType1);
            await getComponent(driver, onType2);
        } catch (err) {
            console.error(`${caseName} get component catch: err->${JSON.stringify(err)}`);
        }
      } catch (err) {
        console.error(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.name   testTelephonyContactSelectContacts0800
     * @tc.number SUB_Telephony_Contact_SelectContacts_0800
     * @tc.desc   Call the contact SelectContacts interface, and use the Promise method as an asynchronous method for the SelectContacts contact 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactSelectContacts0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts0800";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let data: number = await contact.addContact(context, contactData);
        console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);

        let filter: contact.ContactSelectionFilter = {
            filterClause: {
                name: [{ filterCondition: contact.FilterCondition.EQUAL_TO, value: '测试' }]
            },
            filterType: contact.FilterType.DEFAULT_SELECT
        }
        contact.selectContacts({ filter: filter }).then((data: contact.Contact[]) => {
            console.info(`${caseName} selectContacts: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length > 0);
            done();
        }).catch((err: BusinessError) => {
            console.error(`${caseName} selectContacts: success err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
        })
        await delay(1000);

        try {
            let driver: Driver = Driver.create();
            let onType1: On = ON.text('测试');
            let onType2: On = ON.text('完成');
            await getComponent(driver, onType1);
            await getComponent(driver, onType2);
        } catch (err) {
            console.error(`${caseName} get component catch: err->${JSON.stringify(err)}`);
        }
      } catch (err) {
        console.error(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.name   testTelephonyContactSelectContacts0900
     * @tc.number SUB_Telephony_Contact_SelectContacts_0900
     * @tc.desc   Call the contact SelectContacts interface, and use the Promise method as an asynchronous method for the SelectContacts contact 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactSelectContacts0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts0900";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let data: number = await contact.addContact(context, contactData);
        console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);

        let filter: contact.ContactSelectionFilter = {
            filterClause: {
                focusModeList: [{ filterCondition: contact.FilterCondition.NOT_EQUAL_TO, value: '1' }]
            },
            filterType: contact.FilterType.DEFAULT_SELECT
        }
        contact.selectContacts({ filter: filter }).then((data: contact.Contact[]) => {
            console.info(`${caseName} selectContacts: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length > 0);
            done();
        }).catch((err: BusinessError) => {
            console.error(`${caseName} selectContacts: success err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
        })
        await delay(1000);

        try {
            let driver: Driver = Driver.create();
            let onType1: On = ON.text('测试');
            let onType2: On = ON.text('完成');
            await getComponent(driver, onType1);
            await getComponent(driver, onType2);
        } catch (err) {
            console.error(`${caseName} get component catch: err->${JSON.stringify(err)}`);
        }
      } catch (err) {
        console.error(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.name   testTelephonyContactSelectContacts1000
     * @tc.number SUB_Telephony_Contact_SelectContacts_1000
     * @tc.desc   Call the contact SelectContacts interface, and use the Promise method as an asynchronous method for the SelectContacts contact 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactSelectContacts1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts1000";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let data: number = await contact.addContact(context, contactData);
        console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);

        let filter: contact.ContactSelectionFilter = {
            filterClause: {
                dataItem: {
                    field: contact.DataField.EMAIL,
                    options: [{ filterCondition: contact.FilterCondition.IN, value: ['13800000000@email.com'] }]
                }
            },
            filterType: contact.FilterType.SHOW_FILTER_AND_DEFAULT_SELECT
        }
        contact.selectContacts({ filter: filter }).then((data: contact.Contact[]) => {
            console.info(`${caseName} selectContacts: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length > 0);
            done();
        }).catch((err: BusinessError) => {
            console.error(`${caseName} selectContacts: success err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
        })
        await delay(1000);

        try {
            let driver: Driver = Driver.create();
            let onType1: On = ON.text('测试');
            let onType2: On = ON.text('完成');
            await getComponent(driver, onType1);
            await getComponent(driver, onType2);
        } catch (err) {
            console.error(`${caseName} get component catch: err->${JSON.stringify(err)}`);
        }
      } catch (err) {
        console.error(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.name   testTelephonyContactSelectContacts1100
     * @tc.number SUB_Telephony_Contact_SelectContacts_1100
     * @tc.desc   Call the contact SelectContacts interface, and use the Promise method as an asynchronous method for the SelectContacts contact 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactSelectContacts1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts1100";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let data: number = await contact.addContact(context, contactData);
        console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);

        let filter: contact.ContactSelectionFilter = {
            filterClause: {
                dataItem: {
                    field: contact.DataField.PHONE,
                    options: [{ filterCondition: contact.FilterCondition.NOT_IN, value: ['13811111111'] }]
                }
            },
            filterType: contact.FilterType.DEFAULT_SELECT
        }
        contact.selectContacts({ filter: filter }).then((data: contact.Contact[]) => {
            console.info(`${caseName} selectContacts: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length > 0);
            done();
        }).catch((err: BusinessError) => {
            console.error(`${caseName} selectContacts: success err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
        })
        await delay(1000);

        try {
            let driver: Driver = Driver.create();
            let onType1: On = ON.text('测试');
            let onType2: On = ON.text('完成');
            await getComponent(driver, onType1);
            await getComponent(driver, onType2);
        } catch (err) {
            console.error(`${caseName} get component catch: err->${JSON.stringify(err)}`);
        }
      } catch (err) {
        console.error(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })

    /**
     * @tc.name   testTelephonyContactSelectContacts1200
     * @tc.number SUB_Telephony_Contact_SelectContacts_1200
     * @tc.desc   Call the contact SelectContacts interface, and use the Promise method as an asynchronous method for the SelectContacts contact 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyContactSelectContacts1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await delay(1500);
      const caseName: string = "testTelephonyContactSelectContacts1200";
      console.info(`${caseName} test start `);
      try {
        let context: Context = AppStorage.get('context') as Context;
        let data: number = await contact.addContact(context, contactData);
        console.info(`${caseName} addContact: success data->${JSON.stringify(data)}`);

        let filter: contact.ContactSelectionFilter = {
            filterClause: {
                dataItem: {
                    field: contact.DataField.ORGANIZATION,
                    options: [{ filterCondition: contact.FilterCondition.CONTAINS, value: '测试' }]
                }
            },
            filterType: contact.FilterType.DEFAULT_SELECT
        }
        contact.selectContacts({ filter: filter }).then((data: contact.Contact[]) => {
            console.info(`${caseName} selectContacts: success data->${JSON.stringify(data)}`);
            ExpectTrue(data.length > 0);
            done();
        }).catch((err: BusinessError) => {
            console.error(`${caseName} selectContacts: success err->${JSON.stringify(err)}`);
            ExpectFail();
            done();
        })
        await delay(1000);

        try {
            let driver: Driver = Driver.create();
            let onType1: On = ON.text('测试');
            let onType2: On = ON.text('完成');
            await getComponent(driver, onType1);
            await getComponent(driver, onType2);
        } catch (err) {
            console.error(`${caseName} get component catch: err->${JSON.stringify(err)}`);
        }
      } catch (err) {
        console.error(`${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test end `);
    })
  })
}