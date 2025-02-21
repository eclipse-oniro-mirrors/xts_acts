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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import commonEvent from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';

let ACTS_CrossCallFunction = {
  events: ['ACTS_CROSS_CALL_EVENT']
};

const CASE_TIME_OUT = 5000;
let driver = Driver.create();
const BUNDLE = 'MyApp_';
const TAG = '[Sample_MyApp]';
const DOMAIN = 0xF811;
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

function sleep(time) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve();
    }, time)
  });
}

export default function abilityTest() {
  describe('ActsAppTest', function () {
    beforeEach(async (done) => {
      setTimeout(function () {
        console.info('====>beforeEach called');
        done();
      }, 3000);
    })

    /*
     * @tc.number: ACTS_NFC_SelectTypes_0100
     * @tc.name: NFC supports application selection box display and user click application
     * @tc.desc: Set the Want parameter, test the specified Types type, and match the corresponding application
     * @tc.level:1
     */
    it('ACTS_NFC_SelectTypes_0100', 0, async (done) => {
      let want = {
        action: 'ohos.nfc.tag.test.action',
        type: '',
        parameters: {
          'ohos.ability.params.uriTypes': [
            'tag-tech/NFcA',
            'tag-tech/IsoDep'
          ]
        }
      };
      globalThis.abilitycontext.startAbility(
        want, (err) => {
        if (err.code) {
          console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
          return;
        }
        console.info('startAbility succeed');
      }
      );
      await driver.delayMs(2000);
      await driver.assertComponentExist(ON.text("apptest1"));
      await driver.assertComponentExist(ON.text("apptest2"));
      await driver.assertComponentExist(ON.text("apptest3"));
      let app4 = await driver.findComponent(ON.text("apptest4"));
      expect(app4 === null).assertTrue();
      let cancel = await driver.findComponent(ON.text("取消"));
      let cancel1 = await driver.findComponent(ON.id('close_button'));
      if (cancel) {
        await cancel.click();
      }
      if (cancel1) {
        await cancel1.click();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0100 end');
      done();
    })

    /*
     * @tc.number: ACTS_NFC_SelectTypes_0200
     * @tc.name: NFC supports application selection box display and user click application
     * @tc.desc: Set the Want parameter, test the specified Types type, and match the corresponding application
     * @tc.level:1
     */
    it('ACTS_NFC_SelectTypes_0200', 0, async (done) => {
      let want = {
        action: 'ohos.nfc.tag.test.action',
        type: 'tag-tech/NFcA',
        parameters: {
          'ohos.ability.params.uriTypes': [
            'tag-tech/IsoDep'
          ]
        }
      };
      globalThis.abilitycontext.startAbility(
        want, (err) => {
        if (err.code) {
          console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
          return;
        }
        console.info('startAbility succeed');
      }
      );
      await driver.delayMs(2000);
      await driver.assertComponentExist(ON.text("apptest2"));
      await driver.assertComponentExist(ON.text("apptest3"));
      let app1 = await driver.findComponent(ON.text("apptest1"));
      expect(app1 === null).assertTrue();
      let app4 = await driver.findComponent(ON.text("apptest4"));
      expect(app4 === null).assertTrue();
      let cancel = await driver.findComponent(ON.text("取消"));
      let cancel1 = await driver.findComponent(ON.id('close_button'));
      if (cancel) {
        await cancel.click();
      }
      if (cancel1) {
        await cancel1.click();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0200 end');
      done();
    })

    /*
     * @tc.number: ACTS_NFC_SelectTypes_0300
     * @tc.name: NFC supports application selection box display and user click application
     * @tc.desc: Set the Want parameter, test the specified Types type, and match the corresponding application
     * @tc.level:1
     */
    it('ACTS_NFC_SelectTypes_0300', 0, async (done) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0300 begin');
      let want = {
        action: 'ohos.nfc.tag.test.action',
        type: '',
        parameters: {
          'ohos.ability.params.uriTypes': [
          ]
        }
      };
      globalThis.abilitycontext.startAbility(
        want, (err) => {
        if (err.code) {
          console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
          return;
        }
        console.info('startAbility succeed');
      }
      );
      await driver.delayMs(2000);
      let cancel = await driver.findComponent(ON.text("知道了"));
      await cancel.click();
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0300 end');
      done();
    })

    /*
     * @tc.number: ACTS_NFC_SelectTypes_0400
     * @tc.name: NFC supports application selection box display and user click application
     * @tc.desc: Set the Want parameter, test the specified Types type, and match the corresponding application
     * @tc.level:1
     */
    it('ACTS_NFC_SelectTypes_0400', 0, async (done) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0400 begin');
      let want = {
        action: 'ohos.nfc.tag.test.action',
        type: 'tag-tech/NFcA',
        parameters: {
          'ohos.ability.params.uriTypes': [
          ]
        }
      };
      globalThis.abilitycontext.startAbility(
        want, (err) => {
        if (err.code) {
          console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`)
          return;
        }
        console.info('startAbility succeed')
      }
      );
      await driver.delayMs(2000);
      await driver.assertComponentExist(ON.text("apptest1"));
      await driver.assertComponentExist(ON.text("apptest3"));
      let app2 = await driver.findComponent(ON.text("apptest2"));
      let app4 = await driver.findComponent(ON.text("apptest4"));
      expect(app2 === null).assertTrue();
      expect(app4 === null).assertTrue();
      let cancel = await driver.findComponent(ON.text("取消"));
      let cancel1 = await driver.findComponent(ON.id('close_button'));
      if (cancel) {
        await cancel.click();
      }
      if (cancel1) {
        await cancel1.click();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0400 end');
      done();
    })

    /*
     * @tc.number: ACTS_NFC_SelectTypes_0500
     * @tc.name: NFC supports application selection box display and user click application
     * @tc.desc: Set the Want parameter, test the specified Types type, and match the corresponding application
     * @tc.level:1
     */
    it('ACTS_NFC_SelectTypes_0500', 0, async (done) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0500 begin');
      let want = {
        action: 'ohos.nfc.tag.action.TAG',
        type: '',
        parameters: {
          'ohos.ability.params.uriTypes': [
            'tag-tech/NFcA',
            'tag-tech/IsoDep'
          ]
        }
      };
      globalThis.abilitycontext.startAbility(
        want, (err) => {
        if (err.code) {
          console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
          return;
        }
        console.info('startAbility succeed');
      }
      );
      await driver.delayMs(2000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0500: apptest1,apptest2,apptest3,apptest4 notExist');
      let app1 = await driver.findComponent(ON.text("apptest1"));
      let app2 = await driver.findComponent(ON.text("apptest2"));
      let app3 = await driver.findComponent(ON.text("apptest3"));
      let app4 = await driver.findComponent(ON.text("apptest4"));
      expect(app1 === null).assertTrue();
      expect(app2 === null).assertTrue();
      expect(app3 === null).assertTrue();
      expect(app4 === null).assertTrue();
      let cancel = await driver.findComponent(ON.text("知道了"));
      await cancel.click();
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0500 end');
      done();
    })

    /*
     * @tc.number: ACTS_NFC_SelectTypes_0600
     * @tc.name: NFC supports application selection box display and user click application
     * @tc.desc: Set the Want parameter, test the specified Types type, and match the corresponding application
     * @tc.level:1
     */
    it('ACTS_NFC_SelectTypes_0600', 0, async (done) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0600 begin');
      let want = {
        action: 'ohos.nfc.tag.action.TAG',
        type: 'tag-tech/NFcA',
        parameters: {
          'ohos.ability.params.uriTypes': [
          ]
        }
      };
      globalThis.abilitycontext.startAbility(
        want, (err) => {
        if (err.code) {
          console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
          return;
        }
        console.info('startAbility succeed');
      }
      );
      await driver.delayMs(2000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0600: apptest1,apptest2,apptest3,apptest4 notExist');
      let app1 = await driver.findComponent(ON.text("apptest1"));
      let app2 = await driver.findComponent(ON.text("apptest2"));
      let app3 = await driver.findComponent(ON.text("apptest3"));
      let app4 = await driver.findComponent(ON.text("apptest4"));
      expect(app1 === null).assertTrue();
      expect(app2 === null).assertTrue();
      expect(app3 === null).assertTrue();
      expect(app4 === null).assertTrue();
      let cancel = await driver.findComponent(ON.text("知道了"));
      await cancel.click();
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0600 end');
      done();
    })

    /*
     * @tc.number: ACTS_NFC_SelectTypes_0700
     * @tc.name: NFC supports application selection box display and user click application
     * @tc.desc: Set the Want parameter, test the specified Types type, and match the corresponding application
     * @tc.level:3
     */
    it('ACTS_NFC_SelectTypes_0700', 0, async (done) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0700 begin');
      let want = {
        action: 'ohos.nfc.tag.test.action',
        type: 'tag-tech/NFcA',
        parameters: {
          'ohos.ability.params.uriTypes': [
            'tag-tech/MultiAbilityNFCA',
            'tag-tech/MultiAbilityNFCB'
          ]
        }
      };
      globalThis.abilitycontext.startAbility(
        want, (err) => {
        if (err.code) {
          console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
          return;
        }
        console.info('startAbility succeed');
      }
      );
      await driver.delayMs(2000);
      await driver.assertComponentExist(ON.text("MulAbFirst"));
      await driver.assertComponentExist(ON.text("MulAbSecond"));
      let AblityThird = await driver.findComponent(ON.text("MulAbThird"));
      expect(AblityThird === null).assertTrue();
      let cancel = await driver.findComponent(ON.text("取消"));
      let cancel1 = await driver.findComponent(ON.id('close_button'));
      if (cancel) {
        await cancel.click();
      }
      if (cancel1) {
        await cancel1.click();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0700 end');
      done();
    })

    /*
     * @tc.number: ACTS_NFC_SelectTypes_0800
     * @tc.name: NFC supports application selection box display and user click application
     * @tc.desc: Set the Want parameter, test the specified Types type, and match the corresponding application
     * @tc.level:3
     */
    it('ACTS_NFC_SelectTypes_0800' ,0, async (done) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0800 begin');
      let want = {
        action: 'ohos.nfc.tag.test.action',
        type:'tag-tech/NFcA',
        parameters: {
          'ohos.ability.params.uriTypes': [
            'tag-tech/MultiHapNFCA',
            'tag-tech/MultiHapNFCB'
          ]
        }
      };
      globalThis.abilitycontext.startAbility(
        want,(err) => {
        if (err.code) {
          console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
          return;
        }
        console.info('startAbility succeed');
      }
      );
      await driver.delayMs(2000);
      await driver.assertComponentExist(ON.text("MulHapFirst"));
      console.info('startAbility MulHapFirst exist');
      await driver.assertComponentExist(ON.text("MulHapSecond"));
      console.info('startAbility MulHapSecond exist');
      let HapThird = await driver.findComponent(ON.text("MulHapThird"));
      expect(HapThird === null).assertTrue();
      let cancel = await driver.findComponent(ON.text("取消"));
      let cancel1 = await driver.findComponent(ON.id('close_button'));
      if (cancel) {
        await cancel.click();
      }
      if (cancel1) {
        await cancel1.click();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0800 end');
      done();
    })

    /*
     * @tc.number: ACTS_NFC_SelectTypes_0900
     * @tc.name: NFC supports application selection box display and user click application
     * @tc.desc: Set the Want parameter, test the specified Types type, and match the corresponding application
     * @tc.level:1
     */
    it('ACTS_NFC_SelectTypes_0900', 0, async (done) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0900 begin');
      let want = {
        action: 'ohos.want.action.select',
        type: 'tag-tech/NFcA',
        parameters: {
          'ohos.ability.params.uriTypes': [
            'tag-tech/NFcA',
            'tag-tech/IsoDep'
          ]
        }
      };
      globalThis.abilitycontext.startAbility(
        want, (err) => {
        if (err.code) {
          console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
          return;
        }
        console.info('startAbility succeed');
      }
      );
      await driver.delayMs(2000);
      let app1 = await driver.findComponent(ON.text("apptest1"));
      let app2 = await driver.findComponent(ON.text("apptest2"));
      let app3 = await driver.findComponent(ON.text("apptest3"));
      let app4 = await driver.findComponent(ON.text("apptest4"));
      expect(app1 === null).assertTrue();
      expect(app2 === null).assertTrue();
      expect(app3 === null).assertTrue();
      expect(app4 === null).assertTrue();
      let cancel = await driver.findComponents(ON.clickable(true));
      if (cancel !== null) {
        await cancel[0].click();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_0900 end');
      done();
    })

    /*
     * @tc.number: ACTS_NFC_SelectTypes_1000
     * @tc.name: NFC supports application selection box display and user click application
     * @tc.desc: Set the Want parameter, test the specified Types type, and match the corresponding application
     * @tc.level:1
     */
    it('ACTS_NFC_SelectTypes_1000', 0, async (done) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_1000 begin');
      let want = {
        action: 'ohos.nfc.tag.test.action',
        type: '',
        parameters: {
          'ohos.ability.params.uriTypes': [
            'tag-tech/Single'
          ]
        }
      };
      let subscriber;
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilitycontext.startAbility(
          want, (err) => {
          if (err.code) {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('startAbility succeed');
        }
        );

      });
      function subscribeCallBack(err, data) {
        console.info('====>ACTS_NFC_SelectTypes_1000 subscribeCallBack data:' + JSON.stringify(data));
        if (data.event === 'ACTS_CROSS_CALL_EVENT') {
          expect(data.parameters.message === 'select').assertTrue();
          commonEvent.unsubscribe(subscriber, async () => {
            console.info('====>ACTS_NFC_SelectTypes_1000 unSubscribeCallback kill');
            let cmdkill = 'pkill -f com.example.mytest4';
            await abilityDelegator.executeShellCommand(cmdkill);
            await driver.delayMs(2000);
            done();
          })
        }
      }
      setTimeout(() => {
      }, CASE_TIME_OUT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_1000 end');
    })

    /*
     * @tc.number: ACTS_NFC_SelectTypes_1100
     * @tc.name: NFC supports application selection box display and user click application
     * @tc.desc: Set the Want parameter, test the specified Types type, and match the corresponding application
     * @tc.level:1
     */
    it('ACTS_NFC_SelectTypes_1100', 0, async (done) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_1100 begin');
      let want = {
        action: 'ohos.nfc.tag.test.action',
        type: 'tag-tech/Single',
        parameters: {
          'ohos.ability.params.uriTypes': [
          ]
        }
      };
      let subscriber;
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        globalThis.abilitycontext.startAbility(
          want, (err) => {
          if (err.code) {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('startAbility succeed');
        }
        );
      })
      function subscribeCallBack(err, data) {
        console.info('====>ACTS_NFC_SelectTypes_1100 subscribeCallBack data:' + JSON.stringify(data));
        if (data.event === 'ACTS_CROSS_CALL_EVENT') {
          expect(data.parameters.message === 'select').assertTrue();
          commonEvent.unsubscribe(subscriber, async () => {
            console.info('====>ACTS_NFC_SelectTypes_1100 unSubscribeCallback kill');
            let cmdkill = 'pkill -f com.example.mytest4';
            await abilityDelegator.executeShellCommand(cmdkill);
            await driver.delayMs(2000);
            done();
          })
        }
      }
      setTimeout(() => {
      }, CASE_TIME_OUT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_1100 end');
    })

    /*
     * @tc.number: ACTS_NFC_SelectTypes_1200
     * @tc.name: NFC supports application selection box display and user click application
     * @tc.desc: Set the Want parameter, test the specified Types type, and match the corresponding application
     * @tc.level:3
     */
    it('ACTS_NFC_SelectTypes_1200',0, async function (done) {
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_1200 begin');
      let want = {
        action: "ohos.nfc.tag.test.action",
        type: '',
        parameters: {
          'ohos.ability.params.uriTypes': [
            'tag-tech/NFCstandard'
          ]
        }
      };
      await globalThis.abilitycontext.startAbility(want).then(() => {
        console.info('startAbility first succeed');
        expect(true).assertTrue();
      }).catch((err) => {
        console.error(`startAbility first failed, error is ${JSON.stringify(err)}`);
        expect(true).assertFalse();
        done();
      });
      await globalThis.abilitycontext.startAbility(want).then(() => {
        console.info('startAbility second succeed');
        expect(true).assertTrue();
        done();
      }).catch((err) => {
        console.error(`startAbility second failed, error is ${JSON.stringify(err)}`);
        expect(true).assertFalse();
        done();
      });
    })

    /*
     * @tc.number: ACTS_NFC_SelectTypes_1300
     * @tc.name: NFC supports application selection box display and user click application
     * @tc.desc: Set the Want parameter, test the specified Types type, and match the corresponding application
     * @tc.level:3
     */
    it('ACTS_NFC_SelectTypes_1300',0, async function (done) {
      hilog.info(DOMAIN, TAG, '%{public}s', 'ACTS_NFC_SelectTypes_1300 begin');
      let wantSingle = {
        action: "ohos.nfc.tag.test.action",
        type: '',
        parameters: {
          'ohos.ability.params.uriTypes': [
            'tag-tech/Single'
          ]
        }
      };
      let wantStandard = {
        action: "ohos.nfc.tag.test.action",
        type: '',
        parameters: {
          'ohos.ability.params.uriTypes': [
            'tag-tech/NFCstandard'
          ]
        }
      };
      await globalThis.abilitycontext.startAbility(wantSingle).then(() => {
        console.info('startAbility first succeed');
        expect(true).assertTrue();
      }).catch((err) => {
        console.error(`startAbility first failed, error is ${JSON.stringify(err)}`);
        expect(true).assertFalse();
        done();
      });
      await driver.delayMs(2000);
      await globalThis.abilitycontext.startAbility(wantStandard).then(() => {
        console.info('startAbility wantStandard succeed');
        expect(true).assertTrue();
      }).catch((err) => {
        console.error(`startAbility wantStandard failed, error is ${JSON.stringify(err)}`);
        expect(true).assertFalse();
        done();
      });
      await driver.delayMs(2000);
      await globalThis.abilitycontext.startAbility(wantSingle).then(() => {
        console.info('startAbility second succeed');
        expect(true).assertTrue();
        done();
      }).catch((err) => {
        console.error(`startAbility second failed, error is ${JSON.stringify(err)}`);
        expect(true).assertFalse();
        done();
      });
    })
  })
}