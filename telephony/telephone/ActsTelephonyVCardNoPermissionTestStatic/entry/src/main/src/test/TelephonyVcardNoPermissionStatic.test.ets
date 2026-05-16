/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index'
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import vcard from '@ohos.telephony.vcard';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import fs from '@ohos.file.fs';

let domain: Int = 0x0000;
let tag: string = 'TelephonyVCardNoPermissionStatic';
let filePath: string;
let context: common.UIAbilityContext;
let predicates: dataSharePredicates.DataSharePredicates;

async function rdFile(context: common.UIAbilityContext, vcardContacts: string, path: string, fileType?: string): Promise<void> {
  let CASE_NAME: string = `BeforeEachAll`;
  //  Get the application file path
  if (fileType) {
    filePath = context.filesDir + `/contacts_${path}.` + fileType;
  } else {
    filePath = context.filesDir + `/contacts_${path}.vcf`;
  }
  console.info(`${CASE_NAME}the file path is ${filePath}`);
  // Create a new file and open it
  let file: fs.File = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  console.info(`${CASE_NAME} file hhhh ${JSON.stringify(file)}`);
  // Write a paragraph to a file
  let writeLen: number = fs.writeSync(file.fd, vcardContacts);
  console.info(`${CASE_NAME}the length of str is ${writeLen}`);
  // Read a paragraph from a file
  let buf: ArrayBuffer = new ArrayBuffer(1024);
  let readLen: number = fs.readSync(file.fd, buf, {
    offset: 0
  });
  // Close the file
  fs.closeSync(file);
}
export default function TelephonyVcardNoPermissionStatic() {
  filePath = "/data/service/el2/100/hmdfs/account/files/Docs/vcard/Rose.vcf";
  predicates = new dataSharePredicates.DataSharePredicates();
  describe('TelephonyVcardNoPermissionStatic', () => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(async () => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actstelephonyvcardnopermissiontest.static");
        await Utils.msSleep(2000);
        context = AppStorage.get<common.UIAbilityContext>("Context") as common.UIAbilityContext;
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
      }
      await Utils.msSleep(2000);
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    /**
     * @tc.number  SUB_Telephony_Vcard_ImportVCard_0100
     * @tc.name    testTelephonyVcardImportVCard_static_0100
     * @tc.desc    Import the VCard file into the contact database;callback.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it("testTelephonyVcardImportVCard_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyVcardImportVCard_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        context = AppStorage.get<common.UIAbilityContext>("Context") as common.UIAbilityContext;
        let vcardContacts: string = "BEGIN:VCARD\n" + "VERSION:2.1\n" + "N:alpha;;;;\n" + "FN:alpha\n" + "TEL;HOME:17625524867\n" + "END:VCARD\n";
        await rdFile(context, vcardContacts, new Date().getTime() + '');
        hilog.info(domain, tag, `${caseName} test start 111, filePath: ${JSON.stringify(filePath)}`);
        vcard.importVCard(context, filePath, (err) => {
          if (err) {
            hilog.info(domain, tag, `${caseName} error: ${JSON.stringify(err.code)}`);
            expect(err.code === 201).assertTrue();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} success`);
            done();
          }
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} failed, catch: error->${JSON.stringify(error)}`);
        hilog.info(domain, tag, `${caseName} failed, catch: error->${JSON.stringify(error.code)}`);
        expect().assertFail();
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    })

    /**
     * @tc.number  SUB_Telephony_Vcard_ImportVCard_0200
     * @tc.name    testTelephonyVcardImportVCard_static_0200
     * @tc.desc    Import the VCard file into the contact database;callback.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it("testTelephonyVcardImportVCard_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyVcardImportVCard_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        context = AppStorage.get<common.UIAbilityContext>("Context") as common.UIAbilityContext;
        let accountId: int = 0;
        let vcardContacts: string = "BEGIN:VCARD\n" + "VERSION:2.1\n" + "N:alpha123;;;;\n" + "FN:alpha123\n" + "TEL;HOME:17625524867\n" + "END:VCARD\n";
        await rdFile(context, vcardContacts, new Date().getTime() + '');
        hilog.info(domain, tag, `${caseName} test start 111, filePath: ${JSON.stringify(filePath)}`);
        vcard.importVCard(context, filePath, accountId).then(() => {
          hilog.info(domain, tag, `${caseName} success`);
          done();
        }).catch((err) => {
          hilog.info(domain, tag, `${caseName} error ${JSON.stringify(err.code)}`);
          expect(err.code === 201).assertTrue();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} failed, catch: error->${JSON.stringify(error)}`);
        expect().assertFail();
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    })

    /**
     * @tc.number  SUB_Telephony_Vcard_ImportVCard_0300
     * @tc.name    testTelephonyVcardImportVCard_static_0300
     * @tc.desc    Import the VCard file into the contact database;callback.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it("testTelephonyVcardImportVCard_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyVcardImportVCard_static_0300';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        context = AppStorage.get<common.UIAbilityContext>("Context") as common.UIAbilityContext;
        let accountId: int = 0;
        let vcardContacts: string = "BEGIN:VCARD\n" + "VERSION:2.1\n" + "N:alpha11;;;;\n" + "FN:alpha11\n" + "TEL;HOME:17625524867\n" + "END:VCARD\n";
        await rdFile(context, vcardContacts, new Date().getTime() + '');
        hilog.info(domain, tag, `${caseName} test start 111, filePath: ${JSON.stringify(filePath)}`);
        vcard.importVCard(context, filePath, accountId, (err) => {
          if (err) {
            hilog.info(domain, tag, `${caseName} error: ${JSON.stringify(err.code)}`);
            expect(err.code === 201).assertTrue();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} success`);
            done();
          }
        });
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
        expect().assertFail();
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    })

    /**
     * @tc.number  SUB_Telephony_Vcard_ExportVCard_0100
     * @tc.name    testTelephonyVcardExportVCard_static_0100
     * @tc.desc    Import the VCard file into the contact database;callback.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it("testTelephonyVcardExportVCard_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyVcardExportVCard_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        context = AppStorage.get<common.UIAbilityContext>("Context") as common.UIAbilityContext;
        vcard.exportVCard(context, predicates, (err, data) => {
          if (err) {
            hilog.info(domain, tag, `${caseName} error: ${JSON.stringify(err.code)}`);
            expect(err.code === 201).assertTrue();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} success data ${JSON.stringify(data)}`);
            done();
          }
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} failed, catch: error->${JSON.stringify(error)}`);
        expect().assertFail();
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    })

    /**
     * @tc.number  SUB_Telephony_Vcard_ExportVCard_0200
     * @tc.name    testTelephonyVcardExportVCard_static_0200
     * @tc.desc    Import the VCard file into the contact database;callback.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it("testTelephonyVcardExportVCard_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyVcardExportVCard_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        context = AppStorage.get<common.UIAbilityContext>("Context") as common.UIAbilityContext;
        let options: vcard.VCardBuilderOptions = {
          cardType: vcard.VCardType.VERSION_21,
          charset: "UTF-8"
        };
        vcard.exportVCard(context, predicates, options).then((data: string) => {
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          done();
        }).catch((err) => {
          hilog.info(domain, tag, `${caseName} error ${JSON.stringify(err.code)}`);
          expect(err.code === 201).assertTrue();
          done();
        });
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, `${caseName} failed, catch: err->${JSON.stringify(err)}`);
        expect().assertFail();
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    })

    /**
     * @tc.number  SUB_Telephony_Vcard_ExportVCard_0300
     * @tc.name    testTelephonyVcardExportVCard_static_0300
     * @tc.desc    Import the VCard file into the contact database;callback.
     * @tc.size    SmallTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it("testTelephonyVcardExportVCard_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) : Promise<void> => {
      let caseName: string = 'testTelephonyVcardExportVCard_static_0300';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        context = AppStorage.get<common.UIAbilityContext>("Context") as common.UIAbilityContext;
        let options: vcard.VCardBuilderOptions = {
          cardType: vcard.VCardType.VERSION_21,
          charset: "UTF-8"
        };
        vcard.exportVCard(context, predicates, options, (err, data) => {
          if (err) {
            hilog.info(domain, tag, `${caseName} error: ${JSON.stringify(err.code)}`);
            expect(err.code === 201).assertTrue();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} success data ${JSON.stringify(data)}`);
            done();
          }
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} failed, catch: error->${JSON.stringify(error)}`);
        expect().assertFail();
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    })
  });
}
