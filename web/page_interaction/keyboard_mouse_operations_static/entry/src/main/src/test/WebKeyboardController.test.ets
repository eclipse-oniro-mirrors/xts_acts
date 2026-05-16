/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { expect, beforeAll, beforeEach, afterEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import { startAbility, Utils } from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
import wifiMg from '@ohos.wifiManager';

let testAbilityContext:common.UIAbilityContext;

export default function webHitTestTypeEnumTest() {

  describe('webKeyboardControllerEnumTest', () => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

beforeEach(async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      console.info('webOnFirstContFour beforeEach start');
      if(!wifiMg.isWifiActive()){
        let state:boolean = wifiMg.isWifiActive();
        console.info("======> wifi_test/enable wifi: enabled " + state);
        await Utils.msSleep(2000);
      }
      try {
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info("======> Internet WifiLinkedInfo : " + JSON.stringify(data));
        console.info("======> Internet speed : " + JSON.stringify(data.linkSpeed));
        console.info("======> Internet chload : " + JSON.stringify(data.chload));
        console.info("======> Internet rssi : " + JSON.stringify(data.rssi));

        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info("======> WLAN connection established ");
        } else {
          throw new Error("======> WLAN Network error");//方式二
          done();
        }
        if (data.chload >= 900 || data.rssi <= -80) {
          throw new Error("======> WLAN Network error");//方式二
          done();
        } else if (data.chload >= 500) {
          console.info("======> The internet connection is poor. ");
        }
        done();
      } catch (err) {
        console.info("======> getLinkedInfo promise failed, err :" + JSON.stringify(err));
        throw (err as Error);
        done();
      }
    })

    afterEach(async () => {
      await Utils.msSleep(1000);
      console.info('webKeyboardController afterEach end');
    })

    /**
     * @tc.name   webKeyboardControllerStatic002
     * @tc.number SUB_WEB_WEBHITTESTTYPE_ENUM_0100
     * @tc.desc   test the value of WebHitTestType.EditText is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('webKeyboardControllerStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await startAbility('com.pageInteractionFive.test.static', 'EntryAbility');
      await Utils.msSleep(9000);
      console.info('Finish startAbility')

      let testInput = await driver.findComponent(ON.text('Original'))
      expect(testInput != null).assertTrue();
      if (testInput != null) {
        await testInput.click();
        await Utils.msSleep(2000);
        let text = await testInput.getText();
        expect(text).assertEqual('Original');

        let insertBtn = await driver.findComponent(ON.text('insertText'))
        expect(insertBtn != null).assertTrue();
        if (insertBtn != null) {
          await insertBtn.click();
          await Utils.msSleep(2000);
        }
        text = await testInput.getText();
        expect(text).assertEqual('OriginalInsertText');

        let delFBtn = await driver.findComponent(ON.text('deleteForward'))
        expect(delFBtn != null).assertTrue();
        if (delFBtn != null) {
          await delFBtn.click();
          await delFBtn.click();
          await Utils.msSleep(2000);
        }
        text = await testInput.getText();
        expect(text).assertEqual('OriginalInsertTe');

        let delBBtn = await driver.findComponent(ON.text('deleteBackward'))
        expect(delBBtn != null).assertTrue();
        if (delBBtn != null) {
          await delBBtn.click();
          await delBBtn.click();
          await Utils.msSleep(2000);
        }
        text = await testInput.getText();
        expect(text).assertEqual('OriginalInsertTe');
        let textRst = await driver.findComponent(ON.id('ResultShow'));
        expect(textRst != null).assertTrue();
        if (textRst != null) {
          let rst = await textRst.getText();
          console.info(`After deleteBackward, textRst = ${JSON.stringify(rst)}`);
          expect(rst).assertEqual('deleteBackward succeed');
        }

        let sendBtn = await driver.findComponent(ON.text('sendFunctionKey'))
        expect(sendBtn != null).assertTrue();
        if (sendBtn != null) {
          await sendBtn.click();
          await Utils.msSleep(2000);
        }
        if (textRst != null) {
          let rst = await textRst.getText();
          console.info(`After sendFunctionKey, textRst = ${JSON.stringify(rst)}`);
          expect(rst).assertEqual('sendFunctionKey succeed');
        }

        let finishBtn = await driver.findComponent(ON.text('完成'))
        expect(finishBtn != null).assertTrue();
        if (finishBtn != null) {
          await finishBtn.click();
          await Utils.msSleep(2000);
        }
        if (textRst != null) {
          let rst = await textRst.getText();
          console.info(`After finish, textRst = ${JSON.stringify(rst)}`);
          expect(rst).assertEqual('close succeed');
        }
      }

      done();
    })

    /**
     * @tc.name   emitonSwitchNextPage
     * @tc.number emitonSwitchNextPage
     * @tc.desc   emitonSwitchNextPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('emitonSwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("emitonSwitchNextPage", 10)
        await Utils.msSleep(3000);
        let driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('WebwebKeyboardControllerButton'));
        await Utils.msSleep(2000);
        button?.click();
        console.info('click test');
        await Utils.msSleep(6000);
        done()
      })
  })
}
