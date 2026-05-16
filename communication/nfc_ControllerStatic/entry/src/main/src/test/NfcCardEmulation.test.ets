/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import cardEmulation from '@ohos.nfc.cardEmulation';
import { ElementName } from 'bundleManager.ElementName';
import { AsyncCallback } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level,TestType,Size} from '../../../hypium/index';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function nfcCardEmulationTest() {
  describe("nfcCardEmulationTest", (): void=> {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s','beforeAll called');
    })
    beforeEach(() => {
      hilog.info(domain, tag, '%{public}s','beforeEach called');
    })
    afterEach(() => {
      hilog.info(domain, tag, '%{public}s','afterEach called');
    })
    afterAll(() => {
      hilog.info(domain,tag, '%{public}s','afterAll called');
    })
    hilog.info(domain, tag, '%{public}s', 'describe start11');
    /**
     * @tc.number SUB_COMMUNICATION_NFC_Card_static_0100
     * @tc.name SUB_COMMUNICATION_NFC_Card_static_0100
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Card_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0100 PAYMENT is  ' + cardEmulation.CardType.PAYMENT);
      expect(cardEmulation.CardType.PAYMENT).assertEqual('payment');
      hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0100 OTHER is  ' + cardEmulation.CardType.OTHER);
      expect(cardEmulation.CardType.OTHER).assertEqual('other');
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Card_static_0200
     * @tc.name SUB_COMMUNICATION_NFC_Card_static_0200
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Card_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let hasHceCap: boolean = cardEmulation.hasHceCapability();
        if (hasHceCap == true) {
            expect(hasHceCap).assertTrue();
            hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0200 support HCE cardEmulation:  ' + hasHceCap);
        } else {
            expect(hasHceCap).assertFalse();
            hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0200 support HCE cardEmulation:  ' + hasHceCap);
        }
      } catch (error) {
        error = error as BusinessError;
        if (error.code === 201) {
            hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0200 Permission denied.:  ' + error + " - " + error.code);
            expect(201).assertEqual(error.code);
        } else if (error.code === 801) {
            hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0200 Capability not supported.:  ' + error + " - " + error.code);
            expect(801).assertEqual(error.code);
        } else {
            hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0200 failed.:  ' + error + " - " + error.code);
            expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Card_static_0300
     * @tc.name SUB_COMMUNICATION_NFC_Card_static_0300
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Card_static_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let elementName: ElementName = {
          bundleName: "com.example.myapplication",
          moduleName: "entry",
          abilityName: "EntryAbility"
      };
      try {
        let isDefaultService: boolean = cardEmulation.isDefaultService(elementName, cardEmulation.CardType.PAYMENT);
        if (isDefaultService === true) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0300 support HCE cardEmulation:  ' + isDefaultService);
          expect(isDefaultService).assertTrue();
        } else {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0300 support HCE cardEmulation:  ' + isDefaultService);
          expect(isDefaultService).assertFalse();
        }
      } catch(error) {
        error = error as BusinessError;
        if (error.code === 201) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0300 Permission denied.:  ' + error + " - " + error.code);
          expect(201).assertEqual(error.code);
        } else if (error.code === 401) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0300 The parameter check failed.:  ' + error + " - " + error.code);
          expect(801).assertEqual(error.code);
        } else if (error.code === 801) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0300 Capability not supported.:  ' + error + " - " + error.code);
          expect(801).assertEqual(error.code);
        } else {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0300 failed.:  ' + error + " - " + error.code);
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Card_static_0400
     * @tc.name SUB_COMMUNICATION_NFC_Card_static_0400
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Card_static_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let hceService: cardEmulation.HceService = new cardEmulation.HceService();
      if (hceService == null || hceService == undefined) {
        hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0400  HCE undefined ' + hceService);
      }
      let elementName: ElementName = {
        bundleName: "ohos.acts.communication.nfc.nfcdevice",
        abilityName: ".TestAbility",
        moduleName: "nfc_standard_test"
      };
      let aidList: Array<string> = ["A0000000031010", "A0000000031011"];
      try {
        hceService.start(elementName, aidList);
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0400  HCE5 ');
        if (error.code === 201) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0400 Permission denied.:  ' + error + " - " + error.code);
          expect(201).assertEqual(error.code);
        } else if (error.code === 401) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0400 The parameter check failed.:  ' + error + " - " + error.code);
          expect(801).assertEqual(error.code);
        } else if (error.code === 801) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0400 Capability not supported.:  ' + error + " - " + error.code);
          expect(801).assertEqual(error.code);
        } else if (error.code === 3100301) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0400 Card emulation running state is abnormal in service. not supported.:  ' + error + " - " + error.code);
          expect(801).assertEqual(error.code);
        } else {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0400 failed.:  ' + error + " - " + error.code);
          expect().assertFail();
        }
      } 
      done();
    })
  
    /**
     * @tc.number SUB_COMMUNICATION_NFC_Card_static_0500
     * @tc.name SUB_COMMUNICATION_NFC_Card_static_0500
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Card_static_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let hceService: cardEmulation.HceService = new cardEmulation.HceService();
      let elementName: ElementName = {
          bundleName: "com.example.myapplication",
          moduleName: "entry",
          abilityName: "EntryAbility"
      };
      try {
        hceService.stop(elementName);
      } catch (error) {
        error = error as BusinessError;
        if (error.code === 201) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0500 Permission denied.:  ' + error + " - " + error.code);
          expect(201).assertEqual(error.code);
        } else if (error.code === 401) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0500 The parameter check failed.:  ' + error + " - " + error.code);
          expect(801).assertEqual(error.code);
        } else if (error.code === 801) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0500 Capability not supported.:  ' + error + " - " + error.code);
          expect(801).assertEqual(error.code);
        } else if (error.code === 3100301) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0500 Card emulation running state is abnormal in service. not supported.:  ' + error + " - " + error.code);
          expect(801).assertEqual(error.code);
        } else {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0500 failed.:  ' + error + " - " + error.code);
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Card_static_0600
     * @tc.name SUB_COMMUNICATION_NFC_Card_static_0600
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Card_static_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let hceService: cardEmulation.HceService = new cardEmulation.HceService();
      let elementName: ElementName = {
        bundleName: "com.example.myapplication",
        moduleName: "entry",
        abilityName: "EntryAbility"
      };
      let aidList: Array<string> = ["A0000000031010", "A0000000031011"];
      try {
        hceService.start(elementName, aidList);
        hceService.onHceCmd((data)=> {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0600 apduCallback data is :  ' + data);
        });
      } catch (err: BusinessError) {
        if (err.code === 201) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0600 Permission denied. ' + err + " - " + err.code);
          expect(201).assertEqual(err.code);
        } else if (err.code === 401) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0600 Invalid parameter. ' + err + " - " + err.code);
          expect(401).assertEqual(err.code);
        } else if (err.code === 801) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0600 Capability not supported. ' + err + " - " + err.code);
          expect(801).assertEqual(err.code);
        } else {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0600 failed.:  ' + err + " - " + err.code);
          expect().assertFail();
        }
      }
      hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0600 on finish:  ');
      try {
        hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0600 apduCallback:  ');
        hceService.offHceCmd(()=> {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0600 apduCallback err is :  ');
        });
      } catch (err: BusinessError) {
        if (err.code === 201) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0600 Permission denied. ' + err + " - " + err.code);
          expect(201).assertEqual(err.code);
        } else if (err.code === 401) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0600 Invalid parameter. ' + err + " - " + err.code);
          expect(401).assertEqual(err.code);
        } else if (err.code === 801) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0600 Capability not supported. ' + err + " - " + err.code);
          expect(801).assertEqual(err.code);
        } else {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0600 failed.:  ' + err + " - " + err.code);
          expect().assertFail();
        }
      }
      hceService.stop(elementName);
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_NFC_Card_static_0700
     * @tc.name SUB_COMMUNICATION_NFC_Card_static_0700
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Card_static_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let hceService: cardEmulation.HceService = new cardEmulation.HceService();
      hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0700 sucess. ');
      let responseData:Array<int> = [0x1, 0x2];
      try {
        await hceService.transmit(responseData).then(() =>{
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0700 ');
          done();
        });
      } catch (err) {
        err = err as BusinessError;
        if (err.code === 201) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0700 Permission denied. ' + err + " - " + err.code);
          expect(201).assertEqual(err.code);
        } else if (err.code === 401) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0700 Invalid parameter. ' + err + " - " + err.code);
          expect(401).assertEqual(err.code);
        } else if (err.code === 801) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0700 Capability not supported. ' + err + " - " + err.code);
          expect(801).assertEqual(err.code);
        } else if (err.code === 3100301) {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0700 Capability not supported. ' + err + " - " + err.code);
          expect(3100301).assertEqual(err.code);
        } else {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0700 failed.:  ' + err + " - " + err.code);
          expect().assertFail();
        }
        done();
      }
      done();
    })
  
    /**
     * @tc.number SUB_COMMUNICATION_NFC_Card_static_0800
     * @tc.name SUB_COMMUNICATION_NFC_Card_static_0800
     * @tc.desc Check whether the NFC function is enabled.
     * @tc.size since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_NFC_Card_static_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let hceService: cardEmulation.HceService = new cardEmulation.HceService();
      hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0800 Permission denied. ');
      let responseData:Array<int> = [0x1, 0x2];
      hceService.transmit(responseData, (err, data) => {
        if (err){
          if (err.code === 201) {
            hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0800 Permission denied. ' + err + " - " + err.code);
            expect(201).assertEqual(err.code);
          } else if (err.code === 401) {
            hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0800 Invalid parameter. ' + err + " - " + err.code);
            expect(401).assertEqual(err.code);
          } else if (err.code === 801) {
            hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0800 Capability not supported. ' + err + " - " + err.code);
            expect(801).assertEqual(err.code);
          } else if (err.code === 3100301) {
            hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0800 Capability not supported. ' + err + " - " + err.code);
            expect(3100301).assertEqual(err.code);
          } else {
            hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0800 failed.:  ' + err + " - " + err.code);
            expect().assertFail();
          }
          done();
        } else {
          hilog.info(domain,tag,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_Card_static_0800 data.:  ' + data);
          done();
        }
      })
      done();
    })

    console.info("*************[nfc_test] start nfc js unit test end*************");
  })
}