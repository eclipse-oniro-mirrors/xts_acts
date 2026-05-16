/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import pasteboard from '@ohos.pasteboard'
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import { abilityAccessCtrl, common, PermissionRequestResult} from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let TAG = "PASTEBOARD_TAG";
const ARRAY_BUFFER = new ArrayBuffer(256);
const WANT: Want = {
  bundleName: "com.acts.distributeddatamgr.pasteboardtest",
  abilityName: "com.acts.distributeddatamgr.pasteboardtest.MainAbility"
};

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
let listener = () => {
    console.info('The system pasteboard has changed.');
}

let getPermission = async () => {
  console.info('getPermission is start');
  let context:common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext;
  atManager.requestPermissionsFromUser(context, ['ohos.permission.READ_PASTEBOARD'], (err:BusinessError, data:PermissionRequestResult) => {
    console.info('requestPermissionsFromUser success data is' + JSON.stringify(data));
    console.info('requestPermissionsFromUser failed err is' + JSON.stringify(err));
  })
}

let sleep = (ms:number) => {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

let drivenFn = async () => {
  try {
    let driver: Driver = Driver.create();
    console.info('come in driveFn');
    console.info(`driver is ${JSON.stringify(driver)}`);
    await sleep(1000);
    let button = await driver.findComponent(ON.text('始终允许'));
    if (button) {
      console.info('button is $ {JSON.stringify(button)}');
      await sleep(1000);
      await button.click();
      await  sleep(1000);
    } else {
      let button1 = await driver.findComponent(ON.text('仅本次允许'));
      console.info('button is $ {JSON.stringify(button)}');
      await sleep(1000);
      await button1.click();
      await  sleep(1000);
    }
  } catch (err) {
    console.info('err is' + err);
    return
  }
}

export default function pasteBoardInvolingAbnormal() {
  console.info('beforeAll pasteBoardInvolingAbnormal start');
  describe('pasteBoardInvolingAbnormal', () => {
    console.info('beforeAll pasteBoardInvolingAbnormal start2');
    beforeAll(async (done:Function) => {
      console.info('start################################start');
      await getPermission();
      await sleep(1000);
      await drivenFn();
      await sleep(1000);
      done();
    })

    beforeEach(async () => {
      await systemPasteboard.clearData();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0010
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0010
     * @tc.desc   Test createHtmlData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0010 start');
      try{
        let pasteData = pasteboard.createHtmlData('');
        let htmlText: string = pasteData.getPrimaryHtml();
        expect(htmlText == '').assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0010 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0020
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0020
     * @tc.desc   Test createHtmlData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0020 start');
      try{
        let pasteData = pasteboard.createHtmlData(null);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0020 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0030
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0030
     * @tc.desc   Test createHtmlData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0030 start');
      try{
        let pasteData = pasteboard.createHtmlData(undefined);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0030 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0040
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0040
     * @tc.desc   Test createPlainTextData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0040 start');
      try{
        let pasteData = pasteboard.createPlainTextData('');
        let plainText: string = pasteData.getPrimaryText();
        expect(plainText == '').assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0040 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0050
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0050
     * @tc.desc   Test createPlainTextData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0050 start');
      try{
        let pasteData = pasteboard.createPlainTextData(null);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0050 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0060
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0060
     * @tc.desc   Test createPlainTextData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0060 start');
      try{
        let pasteData = pasteboard.createPlainTextData(undefined);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0060 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0070
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0070
     * @tc.desc   Test createWantData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0070 start');
      try{
        let pasteData = pasteboard.createWantData(null);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err !== null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0070 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0080
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0080
     * @tc.desc   Test createWantData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0080 start');
      try{
        let pasteData = pasteboard.createWantData(undefined);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err !== null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0080 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0090
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0090
     * @tc.desc   Test createUriData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0090 start');
      try{
        let pasteData = pasteboard.createUriData('');
        let uriText: string = pasteData.getPrimaryUri();
        expect(uriText == '').assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0090 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0100
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0100
     * @tc.desc   Test createUriData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0100 start');
      try{
        let pasteData = pasteboard.createUriData(null);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0110
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0110
     * @tc.desc   Test createUriData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0110 start');
      try{
        let pasteData = pasteboard.createUriData(undefined);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0110 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0120
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0120
     * @tc.desc   Test createData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0120 start');
      try{
        let pasteData = pasteboard.createData('','hello');
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0120 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0130
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0130
     * @tc.desc   Test createData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0130 start');
      try{
        let pasteData = pasteboard.createData(null,'hello');
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0130 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0140
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0140
     * @tc.desc   Test createData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0140 start');
      try{
        let pasteData = pasteboard.createData(undefined,'hello');
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0140 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0150
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0150
     * @tc.desc   Test createData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0150 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN,'');
        expect(pasteData != null).assertTrue();
        let count: number = pasteData.getRecordCount();
        expect(count).assertEqual(1);
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0150 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0160
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0160
     * @tc.desc   Test createData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0160 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, null);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0160 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0170
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0170
     * @tc.desc   Test createData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0170 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, undefined);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0170 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0180
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0180
     * @tc.desc   Test createData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0180 start');
      try{
        let mimeType = "x".repeat(1024);
        expect(mimeType.length == 1024).assertTrue();
        let pasteData = pasteboard.createData(mimeType, ARRAY_BUFFER);
        let hasType: boolean = pasteData.hasType(mimeType);
        expect(hasType).assertTrue();
        let type: string = pasteData.getPrimaryMimeType();
        expect(type.length == 1024).assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0180 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0190
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0190
     * @tc.desc   Test createData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0190 start');
      try{
        let mimeType = "x".repeat(1025);
        expect(mimeType.length == 1025).assertTrue();
        let pasteData = pasteboard.createData(mimeType, ARRAY_BUFFER);
        let hasType: boolean = pasteData.hasType(mimeType);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0190 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0200
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0200
     * @tc.desc   Test createData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0200 start');
      try{
        let pasteData = pasteboard.createData(null);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0210
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0210
     * @tc.desc   Test createData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0210 start');
      try{
        let pasteData = pasteboard.createData(undefined);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0210 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0220
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0220
     * @tc.desc   Test createHtmlTextRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0220 start');
      try{
        let pasteData = pasteboard.createHtmlTextRecord('');
        let htmlText: string = pasteData.toPlainText();
        expect(htmlText == '').assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0220 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0230
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0230
     * @tc.desc   Test createHtmlTextRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0230 start');
      try{
        let pasteData = pasteboard.createHtmlTextRecord(null);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0230 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0240
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0240
     * @tc.desc   Test createHtmlTextRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0240 start');
      try{
        let pasteData = pasteboard.createHtmlTextRecord(undefined);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0240 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0250
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0250
     * @tc.desc   Test createPlainTextRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0250 start');
      try{
        let pasteData = pasteboard.createPlainTextRecord('');
        let plainText: string = pasteData.toPlainText();
        expect(plainText == '').assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0250 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0260
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0260
     * @tc.desc   Test createPlainTextRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0260 start');
      try{
        let pasteData = pasteboard.createPlainTextRecord(null);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0260 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0270
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0270
     * @tc.desc   Test createPlainTextRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0270 start');
      try{
        let pasteData = pasteboard.createPlainTextRecord(undefined);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0270 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0280
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0280
     * @tc.desc   Test createWantRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0280 start');
      try{
        let pasteData = pasteboard.createWantRecord(null);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err !== null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0280 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0290
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0290
     * @tc.desc   Test createWantRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0290 start');
      try{
        let pasteData = pasteboard.createWantRecord(undefined);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err !== null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0290 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0300
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0300
     * @tc.desc   Test createUriRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0300 start');
      try{
        let pasteData = pasteboard.createUriRecord('');
        let uriText: string = pasteData.toPlainText();
        expect(uriText == '').assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0310
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0310
     * @tc.desc   Test createUriRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0310 start');
      try{
        let pasteData = pasteboard.createUriRecord(null);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0310 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0320
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0320
     * @tc.desc   Test createUriRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0320 start');
      try{
        let pasteData = pasteboard.createUriRecord(undefined);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0320 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0330
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0330
     * @tc.desc   Test createRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0330 start');
      try{
        let pasteData = pasteboard.createRecord('','hello');
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0330 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0340
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0340
     * @tc.desc   Test createRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0340 start');
      try{
        let pasteData = pasteboard.createRecord(null,'hello');
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0340 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0350
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0350
     * @tc.desc   Test createRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0350 start');
      try{
        let pasteData = pasteboard.createRecord(undefined,'hello');
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0350 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0360
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0360
     * @tc.desc   Test createRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0360 start');
      try{
        let pasteData = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, null);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0360 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0370
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0370
     * @tc.desc   Test createRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0370 start');
      try{
        let pasteData = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, undefined);
        expect(pasteData != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0370 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0380
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0380
     * @tc.desc   Test addEntry API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0380 start');
      try{
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        record.addEntry('','hello');
        let datatest = record.getData('');
        expect(datatest != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0380 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0390
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0390
     * @tc.desc   Test addEntry API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0390 start');
      try{
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        record.addEntry(null, 'hello');
        expect(record != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0390 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0400
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0400
     * @tc.desc   Test addEntry API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0400 start');
      try{
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        record.addEntry(undefined, 'hello');
        expect(record != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0410
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0410
     * @tc.desc   Test addEntry API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0410 start');
      try{
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        record.addEntry(pasteboard.MIMETYPE_TEXT_PLAIN, null);
        expect(record != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0410 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0420
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0420
     * @tc.desc   Test addEntry API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0420 start');
      try{
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        record.addEntry(pasteboard.MIMETYPE_TEXT_PLAIN, undefined);
        expect(record != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0420 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0430
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0430
     * @tc.desc   Test getValidTypes API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0430 start');
      try{
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let types: string[] = record.getValidTypes(null);
        expect(types.length != 0).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0430 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0440
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0440
     * @tc.desc   Test getValidTypes API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0440 start');
      try{
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let types: string[] = record.getValidTypes(undefined);
        expect(types.length != 0).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0440 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0450
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0450
     * @tc.desc   Test getValidTypes API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0450 start');
      try{
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let types: string[] = record.getValidTypes([]);
        expect(types.length == 0).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0450 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0460
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0460
     * @tc.desc   Test getData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0460 start');
      try{
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let pastedata = record.getData('');
        expect(pastedata != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0460 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0470
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0470
     * @tc.desc   Test getData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0470 start');
      try{
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let pastedata = record.getData(null);
        expect(pastedata != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0470 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0480
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0480
     * @tc.desc   Test getData API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0480 start');
      try{
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let pastedata = record.getData(undefined);
        expect(pastedata != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0480 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0490
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0490
     * @tc.desc   Test addHtmlRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0490 start');
      try{
        let pasteData = pasteboard.createPlainTextData('hello');
        pasteData.addHtmlRecord('');
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_HTML);
        expect(hasType).assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0490 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0500
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0500
     * @tc.desc   Test addHtmlRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0500 start');
      try{
        let pasteData = pasteboard.createPlainTextData('hello');
        pasteData.addHtmlRecord(null);
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_HTML);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0510
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0510
     * @tc.desc   Test addHtmlRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0510 start');
      try{
        let pasteData = pasteboard.createPlainTextData('hello');
        pasteData.addHtmlRecord(undefined);
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_HTML);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0510 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0520
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0520
     * @tc.desc   Test addWantRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0520 start');
      try{
        let pasteData = pasteboard.createPlainTextData('hello');
        pasteData.addWantRecord(null);
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_WANT);
        console.log(TAG+'hasType: ' + hasType);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err !== null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0520 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0530
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0530
     * @tc.desc   Test addWantRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0530 start');
      try{
        let pasteData = pasteboard.createPlainTextData('hello');
        pasteData.addWantRecord(undefined);
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_WANT);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err !== null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0530 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0540
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0540
     * @tc.desc   Test addTextRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0540 start');
      try{
        let pasteData = pasteboard.createUriData('dataability:///com.example.myapplication1/user.txt');
        pasteData.addTextRecord('');
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN);
        expect(hasType).assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0540 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0550
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0550
     * @tc.desc   Test addTextRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0550 start');
      try{
        let pasteData = pasteboard.createUriData('dataability:///com.example.myapplication1/user.txt');
        pasteData.addTextRecord(null);
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0550 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0560
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0560
     * @tc.desc   Test addTextRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0560 start');
      try{
        let pasteData = pasteboard.createUriData('dataability:///com.example.myapplication1/user.txt');
        pasteData.addTextRecord(undefined);
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0560 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0570
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0570
     * @tc.desc   Test addUriRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0570 start');
      try{
        let pasteData = pasteboard.createPlainTextData('hello');
        pasteData.addUriRecord('');
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_URI);
        expect(hasType).assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0570 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0580
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0580
     * @tc.desc   Test addUriRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0580 start');
      try{
        let pasteData = pasteboard.createPlainTextData('hello');
        pasteData.addUriRecord(null);
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_URI);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0580 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0590
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0590
     * @tc.desc   Test addUriRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0590 start');
      try{
        let pasteData = pasteboard.createPlainTextData('hello');
        pasteData.addUriRecord(undefined);
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_URI);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(401);
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0590 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0600
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0600
     * @tc.desc   Test addRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0600 start');
      try{
        let pasteData = pasteboard.createData("string", ARRAY_BUFFER);
        let pasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_HTML, '');
        pasteData.addRecord(pasteDataRecord)
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_HTML);
        expect(hasType).assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0610
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0610
     * @tc.desc   Test addRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0610 start');
      try{
        let pasteData = pasteboard.createData("string", ARRAY_BUFFER);
        let pasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, '');
        pasteData.addRecord(pasteDataRecord)
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN);
        expect(hasType).assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0610 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0620
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0620
     * @tc.desc   Test addRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0620 start');
      try{
        let pasteData = pasteboard.createData("string", ARRAY_BUFFER);
        let pasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_URI, '');
        pasteData.addRecord(pasteDataRecord)
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_URI);
        expect(hasType).assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0620 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0630
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0630
     * @tc.desc   Test addRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0630 start');
      try{
        let pasteData = pasteboard.createData("string", ARRAY_BUFFER);
        let pasteDataRecord = pasteboard.createRecord('', 'hello');
        pasteData.addRecord(pasteDataRecord);
        let hasType: boolean = pasteData.hasType('');
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0630 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0640
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0640
     * @tc.desc   Test addRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0640 start');
      try{
        let pasteData = pasteboard.createData("string", ARRAY_BUFFER);
        let pasteDataRecord = pasteboard.createRecord('ceshi', '');
        pasteData.addRecord(pasteDataRecord);
        let hasType: boolean = pasteData.hasType('ceshi');
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0640 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0650
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0650
     * @tc.desc   Test addRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0650 start');
      try{
        let pasteData = pasteboard.createData("string", ARRAY_BUFFER);
        pasteData.addRecord(null)
        let hasType: boolean = pasteData.hasType('string');
        console.log(TAG+'hasType: ' + hasType);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err !== null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0650 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0660
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0660
     * @tc.desc   Test addRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0660 start');
      try{
        let pasteData = pasteboard.createData("string", ARRAY_BUFFER);
        pasteData.addRecord(undefined)
        let hasType: boolean = pasteData.hasType('string');
        console.log(TAG+'hasType: ' + hasType);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err !== null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0660 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0670
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0670
     * @tc.desc   Test addRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0670 start');
      try{
        let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
        pasteData.addRecord('', 'hello');
        let hasType: boolean = pasteData.hasType('');
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0670 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0680
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0680
     * @tc.desc   Test addRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0680 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
        pasteData.addRecord(null, 'hello');
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_URI);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0680 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0690
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0690
     * @tc.desc   Test addRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0690 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
        pasteData.addRecord(undefined, 'hello');
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_URI);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0690 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0700
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0700
     * @tc.desc   Test addRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0700 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
        pasteData.addRecord('text/plain', null);
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0710
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0710
     * @tc.desc   Test addRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0710 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
        pasteData.addRecord('text/plain', undefined);
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0710 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0720
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0720
     * @tc.desc   Test getProperty API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0720 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "test");
        let prop = pasteData.getProperty();
        let property = prop.additions['text/plain'];
        expect(property == null).assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0720 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0730
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0730
     * @tc.desc   Test getProperty API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0730 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "test");
        let prop = pasteData.getProperty();
        prop.additions = { "key": null, "userKey": undefined };
        pasteData.setProperty(prop);
        let newprop = pasteData.getProperty();
        let keydata = newprop.additions["key"];
        expect(keydata).assertEqual(undefined);
        let userKeydata = newprop.additions["userKey"];
        expect(userKeydata).assertEqual(undefined);
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0730 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0740
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0740
     * @tc.desc   Test setProperty API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0740 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "test");
        pasteData.setProperty(null);
        let newprop = pasteData.getProperty();
        expect(newprop != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0740 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0750
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0750
     * @tc.desc   Test setProperty API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0750 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "test");
        pasteData.setProperty(undefined);
        let newprop = pasteData.getProperty();
        expect(newprop != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0750 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0760
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0760
     * @tc.desc   Test getRecordAt API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0760 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let record = pasteData.getRecordAt(null);
        expect(record != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0760 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0770
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0770
     * @tc.desc   Test getRecordAt API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0770 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let record = pasteData.getRecordAt(undefined);
        expect(record != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0770 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0780
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0780
     * @tc.desc   Test getRecordAt API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0780 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, "<html>hello</html>");
        let pasteDataRecord = pasteData.getRecordAt(0);
        let mimetypedata = pasteDataRecord.htmlText;
        expect(mimetypedata).assertEqual("<html>hello</html>");
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0780 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0790
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0790
     * @tc.desc   Test getRecordAt API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0790 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_WANT, WANT);
        let pasteDataRecord = pasteData.getRecordAt(0);
        let mimetypedata = pasteDataRecord.want;
        expect(pasteDataRecord.mimeType).assertEqual(pasteboard.MIMETYPE_TEXT_WANT);
        expect(String(WANT.bundleName)).assertEqual(mimetypedata.bundleName)
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0790 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0800
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0800
     * @tc.desc   Test getRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0800 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let record = pasteData.getRecord(null);
        expect(record != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0810
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0810
     * @tc.desc   Test getRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0810 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let record = pasteData.getRecord(undefined);
        expect(record != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0810 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0820
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0820
     * @tc.desc   Test getRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0820 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, "<html>hello</html>");
        let pasteDataRecord = pasteData.getRecord(1);
        let mimetypedata = pasteDataRecord.htmlText;
        expect(mimetypedata).assertEqual("<html>hello</html>");
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(12900001));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0820 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0830
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0830
     * @tc.desc   Test hasMimeType API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0830 start');
      try{
        let pasteData = pasteboard.createData('', 'hello');
        let hasType = pasteData.hasMimeType('');
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0830 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0840
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0840
     * @tc.desc   Test hasMimeType API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0840 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let hasType = pasteData.hasMimeType(null);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0840 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0850
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0850
     * @tc.desc   Test hasMimeType API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0850 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let hasType = pasteData.hasMimeType(undefined);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0850 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0860
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0860
     * @tc.desc   Test hasType API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0860 start');
      try{
        let pasteData = pasteboard.createData('', 'hello');
        let hasType = pasteData.hasType('');
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0860 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0870
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0870
     * @tc.desc   Test hasType API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0870 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let hasType = pasteData.hasType(null);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0870 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0880
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0880
     * @tc.desc   Test hasType API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0880 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        let hasType = pasteData.hasType(undefined);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0880 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0890
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0890
     * @tc.desc   Test removeRecordAt API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0890 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        pasteData.removeRecordAt(null);
        let hasType = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0890 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0900
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0900
     * @tc.desc   Test removeRecordAt API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0900 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        pasteData.removeRecordAt(undefined);
        let hasType = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0900 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0910
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0910
     * @tc.desc   Test removeRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0910 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        pasteData.removeRecord(null);
        let hasType = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0910 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0920
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0920
     * @tc.desc   Test removeRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0920 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        pasteData.removeRecord(undefined);
        let hasType = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0920 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0930
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0930
     * @tc.desc   Test removeRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0930 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
        pasteData.removeRecord(1);
        let hasType = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN);
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(12900001));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0930 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0940
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0940
     * @tc.desc   Test replaceRecordAt API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0940 start');
      try{
        let pasteData = pasteboard.createUriData('dataability:///com.example.myapplication1/user.txt');
        let record = pasteboard.createPlainTextRecord('');
        let isReplace = pasteData.replaceRecordAt(0, record);
        expect(isReplace).assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0940 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0950
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0950
     * @tc.desc   Test replaceRecordAt API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0950 start');
      try{
        let pasteData = pasteboard.createPlainTextData('content');
        let record = pasteboard.createHtmlTextRecord('');
        let isReplace = pasteData.replaceRecordAt(0, record);
        expect(isReplace).assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0950 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0960
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0960
     * @tc.desc   Test replaceRecordAt API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0960 start');
      try{
        let pasteData = pasteboard.createPlainTextData('content');
        let record = pasteboard.createUriRecord('');
        let isReplace = pasteData.replaceRecordAt(0, record);
        expect(isReplace).assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0960 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0970
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0970
     * @tc.desc   Test replaceRecordAt API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0970 start');
      try{
        let pasteData = pasteboard.createData("string", ARRAY_BUFFER);
        let record = pasteboard.createRecord('ceshi', '');
        let isReplace = pasteData.replaceRecordAt(0, record);
        expect(isReplace).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0970 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0980
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0980
     * @tc.desc   Test replaceRecordAt API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0980 start');
      try{
        let pasteData = pasteboard.createPlainTextData('content');
        let record = pasteboard.createHtmlTextRecord('<html>hello</html>');
        let isReplace = pasteData.replaceRecordAt(null, record);
        expect(isReplace).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err !== null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0980 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_0990
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_0990
     * @tc.desc   Test replaceRecordAt API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0990 start');
      try{
        let pasteData = pasteboard.createPlainTextData('content');
        let record = pasteboard.createHtmlTextRecord('<html>hello</html>');
        let isReplace = pasteData.replaceRecordAt(undefined, record);
        expect(isReplace).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err !== null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_0990 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1000
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1000
     * @tc.desc   Test replaceRecordAt API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1000 start');
      try{
        let pasteData = pasteboard.createPlainTextData('content');
        let isReplace = pasteData.replaceRecordAt(0, null);
        console.log(TAG+'isReplace: ' + isReplace);
        expect(isReplace).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err !== null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1000 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1010
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1010
     * @tc.desc   Test replaceRecordAt API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1010 start');
      try{
        let pasteData = pasteboard.createPlainTextData('content');
        let isReplace = pasteData.replaceRecordAt(0, undefined);
        console.log(TAG+'isReplace: ' + isReplace);
        expect(isReplace).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err !== null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1010 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1020
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1020
     * @tc.desc   Test replaceRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1020 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_PLAIN, '');
        pasteData.replaceRecord(0, record);
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_PLAIN);
        expect(hasType).assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1020 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1030
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1030
     * @tc.desc   Test replaceRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1030 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello woeld');
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_HTML, '');
        pasteData.replaceRecord(0, record);
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_HTML);
        expect(hasType).assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1030 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1040
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1040
     * @tc.desc   Test replaceRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1040 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello woeld');
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_URI, '');
        pasteData.replaceRecord(0, record);
        let hasType: boolean = pasteData.hasType(pasteboard.MIMETYPE_TEXT_URI);
        expect(hasType).assertTrue();
      }catch(err){
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1040 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1050
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1050
     * @tc.desc   Test replaceRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1050 start');
      try{
        let pasteData = pasteboard.createData("string", ARRAY_BUFFER);
        let record = pasteboard.createRecord('ceshi', '');
        pasteData.replaceRecord(0, record);
        let hasType: boolean = pasteData.hasType('ceshi');
        expect(hasType).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1050 end');
      done();
    })
    
    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1060
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1060
     * @tc.desc   Test replaceRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1060 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_HTML, '<html>hello</html>');
        let isReplace = pasteData.replaceRecord(null, record);
        expect(isReplace).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1060 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1070
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1070
     * @tc.desc   Test replaceRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1070 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
        let record = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_HTML, '<html>hello</html>');
        let isReplace = pasteData.replaceRecord(undefined, record);
        expect(isReplace).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1070 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1080
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1080
     * @tc.desc   Test replaceRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1080 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
        let isReplace = pasteData.replaceRecord(0, null);
        expect(isReplace).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1080 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1090
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1090
     * @tc.desc   Test replaceRecord API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1090 start');
      try{
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
        let isReplace = pasteData.replaceRecord(0, undefined);
        expect(isReplace).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1090 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1100
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1100
     * @tc.desc   Test on API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1100 start');
      try{
        systemPasteboard.on(null,listener);
        expect(systemPasteboard != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1100 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1110
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1110
     * @tc.desc   Test on API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1110 start');
      try{
        systemPasteboard.on(undefined,listener);
        expect(systemPasteboard != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1110 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1120
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1120
     * @tc.desc   Test off API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1120 start');
      try{
        systemPasteboard.off(null);
        expect(systemPasteboard != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1120 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1130
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1130
     * @tc.desc   Test off API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1130 start');
      try{
        systemPasteboard.off(undefined);
        expect(systemPasteboard != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1130 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1140
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1140
     * @tc.desc   Test off API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1140 start');
      try{
        systemPasteboard.off(undefined);
        expect(systemPasteboard != null).assertTrue();
      }catch(err){
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1140 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1150
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1150
     * @tc.desc   hasDataType with empty string mimeType test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1150 start');
      try {
        await systemPasteboard.setData(pasteboard.createData('text/plain', 'test'));
        let hasType = systemPasteboard.hasDataType('');
        console.log(TAG+'hasType: ' + hasType);
        expect(hasType == false).assertTrue();
      } catch (err) {
        console.error(TAG + `pasteboard interface failed:${err.message}`);
        expect(err === null).assertTrue();
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1150 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1160
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1160
     * @tc.desc   hasDataType with null mimeType test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1160 start');
      await systemPasteboard.setData(pasteboard.createData('text/plain', 'test'));
      try {
        let hasType = systemPasteboard.hasDataType(null);
      } catch (err) {
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1160 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1170
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1170
     * @tc.desc   hasDataType with undefined mimeType test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1170 start');
      await systemPasteboard.setData(pasteboard.createData('text/plain', 'test'));
      try {
        let hasType = systemPasteboard.hasDataType(undefined);
      } catch (err) {
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1170 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1180
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1180
     * @tc.desc   setPasteData with null mimeType test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1180 start');
      try {
        await systemPasteboard.setPasteData(null);
      } catch (err) {
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1180 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1190
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1190
     * @tc.desc   setPasteData with undefined mimeType test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1190 start');
      try {
        await systemPasteboard.setPasteData(undefined);
      } catch (err) {
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1190 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1200
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1200
     * @tc.desc   setPasteData with null mimeType test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1200 start');
      try {
        await systemPasteboard.setPasteData(null, (err, data) => {
          if (err) {
            console.error('Failed to set PasteData. Cause: ' + err.message);
            return;
          }
          console.info('Succeeded in setting PasteData.');
        })
      } catch (err) {
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1200 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1210
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1210
     * @tc.desc   setPasteData with undefined mimeType test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1210 start');
      try {
        await systemPasteboard.setPasteData(undefined, (err, data) => {
          if (err) {
            console.error('Failed to set PasteData. Cause: ' + err.message);
            return;
          }
          console.info('Succeeded in setting PasteData.');
        })
      } catch (err) {
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1210 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1220
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1220
     * @tc.desc   setData with null mimeType test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1220 start');
      try {
        await systemPasteboard.setData(null);
      } catch (err) {
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1220 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1230
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1230
     * @tc.desc   setData with undefined mimeType test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1230 start');
      try {
        await systemPasteboard.setData(undefined);
      } catch (err) {
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1230 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1240
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1240
     * @tc.desc   setData with null mimeType test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1240 start');
      try {
        await systemPasteboard.setData(null, (err, data) => {
          if (err) {
            console.error('Failed to set PasteData. Cause: ' + err.message);
            return;
          }
          console.info('Succeeded in setting PasteData.');
        })
      } catch (err) {
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1240 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1250
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1250
     * @tc.desc   setData with undefined mimeType test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1250 start');
      try {
        await systemPasteboard.setData(undefined, (err, data) => {
          if (err) {
            console.error('Failed to set PasteData. Cause: ' + err.message);
            return;
          }
          console.info('Succeeded in setting PasteData.');
        })
      } catch (err) {
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1250 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1260
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1260
     * @tc.desc   getDataWithProgress with null mimeType test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1260 start');
      try {
        await systemPasteboard.getDataWithProgress(null);
      } catch (err) {
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1260 end');
      done();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_Abnormal_1270
     * @tc.number SUB_Pasteboard_Local_SDK_Abnormal_1270
     * @tc.desc   getDataWithProgress with undefined mimeType test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Pasteboard_Local_SDK_Abnormal_1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1270 start');
      try {
        await systemPasteboard.getDataWithProgress(undefined);
      } catch (err) {
        console.log(TAG+'err.code: ' + err.code+'error.message: '+err.message);
        expect(err.code).assertEqual(String(401));
      }
      console.info('SUB_Pasteboard_Local_SDK_Abnormal_1270 end');
      done();
    })
  })
}