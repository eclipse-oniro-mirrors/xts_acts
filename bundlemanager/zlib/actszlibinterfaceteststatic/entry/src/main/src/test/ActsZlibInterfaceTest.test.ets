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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach} from "../../../hypium/index";
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import hilog from '@ohos.hilog';
import zlib from '@ohos.zlib'
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let context: common.UIAbilityContext;
let dir: string = "";

export default function ActsZlibInterfaceTest() {
  describe('ActsZlibInterfaceTest', ():void => {
    beforeAll(() => {
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(domain, tag, 'ActsZlibTest abilityDelegator success');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.actszlibinterfacetest.test.static");
      await Utils.msSleep(3000);
      let dirAll = AppStorage.get<string>("dir");
      if(dirAll) {
        dir = dirAll!;
      }
      hilog.info(domain, tag, 'ActsZlibTest dir: ' + dir);
      hilog.info(domain, tag, 'beforeAll end');
    });

    /**
     * @tc.name   ActsZlibInterfaceTest_static_01
     * @tc.number ACTS_ZlibInterfaceTest_static_01
     * @tc.desc   test getOriginalSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibInterfaceTest_static_01', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = 'ActsZlibInterfaceTest01';
      hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_01 start==================");
      let inFile33: string = dir;
      let outFile35: string = dir + '/test35.zip';
      let options: zlib.Options = {
        level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
        memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
        strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
      };
      try {
        zlib.compressFile(inFile33, outFile35, options).then((): Promise<void> => {
          hilog.info(domain, tag, 'getOriginalSize prepare test.zip success');
          try {
            zlib.getOriginalSize(outFile35).then((data: long): void => {
              hilog.info(domain, tag, `ActsZlibInterfaceTest_static_01 getOriginalSize success. getOriginalSize: ${data}`);
              expect(data >= 0).assertEqual(true);
              done();
              }).catch((errData: Error): void => {
                hilog.error(domain, tag,
                  `ACTS_ZlibInterfaceTest_static_01 getOriginalSize failed errData is errCode:${errData.code}  message:${errData.message}`);
                expect(errData).assertFail();
              done();
            });
          } catch(errData) {
            hilog.error(domain, tag, `011 errData is errCode:${errData.code}  message:${errData.message}`);
            expect(errData).assertFail();
            done();
          }
        }, (errData: Error): void => {
          hilog.error(domain, tag, `012 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData).assertFail();
          done();
        })
      } catch(errData) {
        hilog.error(domain, tag, `013 errData is errCode:${errData.code}  message:${errData.message}`);
        expect(errData).assertFail();
        done();
      }
      hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_01 end==================");
    })

    /**
     * @tc.name   ACTS_ZlibInterfaceTest_static_03
     * @tc.number ACTS_ZlibInterfaceTest_static_03
     * @tc.desc   test getOriginalSize 900001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ACTS_ZlibInterfaceTest_static_03', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_03 start==================");
      let compressedFile: string = dir + '/not_found.zip';
      try {
        zlib.getOriginalSize(compressedFile).then((data: long): void => {
          hilog.info(domain, tag, `ACTS_ZlibInterfaceTest_static_03 getOriginalSize success. getOriginalSize: ${data}`);
          expect(data).assertFail();
          done();
        }).catch((errData: Error): void=> {
          hilog.info(domain, 'bmsTestTag',`015 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(900001);
          done();
        })
      } catch(errData) {
        hilog.error(domain, tag, `ACTS_ZlibInterfaceTest_static_03 errData is errCode:${errData.code}  message:${errData.message}`);
        expect(errData).assertFail();
        done();
      }
      hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_03 end==================");
    })

    /**
     * @tc.name   ACTS_ZlibInterfaceTest_static_04
     * @tc.number ACTS_ZlibInterfaceTest_static_04
     * @tc.desc   test getOriginalSize 900003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ACTS_ZlibInterfaceTest_static_04', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_04 start==================");
      let file = fs.openSync(dir + '/test33.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "test: Try to write str.");
      hilog.info(domain, tag, `test.txt: wirteLen ${writeLen}`);
      fs.closeSync(file);
      let compressedFile30: string = dir + '/test33.txt';
      try {
        zlib.getOriginalSize(compressedFile30).then((data: long): void => {
          hilog.info(domain, tag, `ACTS_ZlibInterfaceTest_static_04 getOriginalSize success. getOriginalSize: ${data}`);
          expect(data).assertFail();
          done();
        }).catch((errData: Error): void=> {
          hilog.info(domain, 'bmsTestTag', `016 errData is errCode:${errData.code}  message:${errData.message}`);
          expect(errData.code).assertEqual(900003);
          done();
        })
      } catch(errData) {
        hilog.error(domain, tag, `ACTS_ZlibInterfaceTest_static_04 errData is errCode:${errData.code}  message:${errData.message}`);
        expect(errData).assertFail();
        done();
      }
      hilog.info(domain, tag, "==================ACTS_ZlibInterfaceTest_static_04 end==================");
    })

  })
}